import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/base_colors.dart';
import 'package:tanampedia/core/widgets/catalog_states.dart';
import 'package:tanampedia/features/catalog/data/models/plant.dart';
import 'package:tanampedia/features/catalog/pages/catalog_detail_page.dart';
import 'package:tanampedia/features/catalog/state/catalog_controller.dart';
import 'package:tanampedia/features/catalog/widgets/catalog_sort_sheet.dart';
import 'package:tanampedia/features/catalog/widgets/plant_card.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final CatalogController _controller = CatalogController();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_refresh);
    _scrollController.addListener(_loadNextPageWhenNeeded);
    _controller.loadPlants();
  }

  @override
  void dispose() {
    _controller.removeListener(_refresh);
    _controller.dispose();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  void _loadNextPageWhenNeeded() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels > position.maxScrollExtent - 400) {
      _controller.loadPlants(refresh: false);
    }
  }

  Future<void> _search() async {
    FocusManager.instance.primaryFocus?.unfocus();
    await _controller.applyQuery(_searchController.text);
  }

  void _openSortSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return CatalogSortSheet(
          selectedSort: _controller.sort,
          onSelected: (value) {
            Navigator.pop(context);
            _controller.applySort(value);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _controller.loadPlants(),
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
            sliver: SliverToBoxAdapter(child: _buildHeader()),
          ),
          ..._buildContent(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Katalog Tanaman', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 6),
        const Text('Temukan referensi tanaman untuk menemani perjalanan berkebunmu.'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _search(),
                decoration: InputDecoration(
                  hintText: 'Cari nama tanaman...',
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: IconButton(onPressed: _search, icon: const Icon(Icons.arrow_forward_rounded)),
                  filled: true,
                  fillColor: BaseColors.raised,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filledTonal(onPressed: _openSortSheet, icon: const Icon(Icons.swap_vert_rounded)),
          ],
        ),
        if (_controller.total != null) ...[
          const SizedBox(height: 12),
          Text('${_controller.total} tanaman ditemukan', style: const TextStyle(color: BaseColors.textSecondary)),
        ],
      ],
    );
  }

  List<Widget> _buildContent() {
    if (_controller.status == CatalogStatus.initial ||
        (_controller.status == CatalogStatus.loading && _controller.plants.isEmpty)) {
      return [const SliverFillRemaining(child: Center(child: CircularProgressIndicator()))];
    }
    if (_controller.status == CatalogStatus.error && _controller.plants.isEmpty) {
      return [SliverFillRemaining(child: CatalogErrorState(message: _controller.errorMessage, onRetry: () => _controller.loadPlants()))];
    }
    if (_controller.status == CatalogStatus.success && _controller.plants.isEmpty) {
      return [SliverFillRemaining(child: CatalogEmptyState(hasQuery: _controller.query.isNotEmpty))];
    }
    return [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final plant = _controller.plants[index];
              return PlantCard(plant: plant, onTap: () => _openDetail(plant));
            },
            childCount: _controller.plants.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
        ),
      ),
      if (_controller.status == CatalogStatus.loadingMore)
        const SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(16), child: Center(child: CircularProgressIndicator()))),
    ];
  }

  void _openDetail(Plant plant) {
    if (plant.slug.isEmpty) return;
    Navigator.push(context, MaterialPageRoute(builder: (_) => CatalogDetailPage(slug: plant.slug)));
  }
}
