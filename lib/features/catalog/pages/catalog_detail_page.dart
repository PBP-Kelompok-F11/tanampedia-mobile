import 'package:flutter/material.dart';
import 'package:tanampedia/core/network/api_exception.dart';
import 'package:tanampedia/core/themes/base_colors.dart';
import 'package:tanampedia/features/catalog/data/catalog_repository.dart';
import 'package:tanampedia/features/catalog/data/models/plant.dart';
import 'package:tanampedia/features/catalog/widgets/care_card.dart';
import 'package:tanampedia/features/catalog/widgets/plant_image.dart';

class CatalogDetailPage extends StatefulWidget {
  const CatalogDetailPage({required this.slug, super.key});

  final String slug;

  @override
  State<CatalogDetailPage> createState() => _CatalogDetailPageState();
}

class _CatalogDetailPageState extends State<CatalogDetailPage> {
  final CatalogRepository _repository = CatalogRepository();
  Plant? _plant;
  String? _error;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadDetail();
  }

  Future<void> _loadDetail() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final plant = await _repository.getPlantDetail(widget.slug);
      if (!mounted) return;
      setState(() {
        _plant = plant;
        _loading = false;
      });
    } on ApiException catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error.message;
        _loading = false;
      });
    } on Exception {
      if (!mounted) return;
      setState(() {
        _error = 'Detail tanaman tidak dapat dimuat.';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Tanaman')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_error!, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(onPressed: _loadDetail, child: const Text('Coba lagi')),
            ],
          ),
        ),
      );
    }
    if (_plant == null) {
      return const Center(child: Text('Tanaman tidak ditemukan.'));
    }
    return _PlantDetailContent(plant: _plant!);
  }
}

class _PlantDetailContent extends StatelessWidget {
  const _PlantDetailContent({required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlantImage(url: plant.imageUrl, borderRadius: 22),
          const SizedBox(height: 20),
          Text(plant.displayName, style: Theme.of(context).textTheme.headlineMedium),
          if (plant.scientificName != null)
            Text(plant.scientificName!, style: const TextStyle(fontStyle: FontStyle.italic)),
          if (plant.family != null) _infoLine('Famili', plant.family!),
          const SizedBox(height: 24),
          _sectionTitle(context, 'Taksonomi'),
          _taxonomyCard(),
          const SizedBox(height: 24),
          _sectionTitle(context, 'Panduan Perawatan'),
          _careSection(),
          if (plant.sourceUrl != null) ...[
            const SizedBox(height: 24),
            _sectionTitle(context, 'Sumber Data'),
            Text('Data referensi berasal dari Trefle API.'),
            const SizedBox(height: 8),
            SelectableText(plant.sourceUrl!),
          ],
        ],
      ),
    );
  }

  Widget _taxonomyCard() {
    final values = <String, String>{};
    if (plant.genus != null) values['Genus'] = plant.genus!;
    if (plant.family != null) values['Famili'] = plant.family!;
    if (plant.year != null) values['Tahun'] = plant.year.toString();
    if (plant.bibliography != null) values['Bibliografi'] = plant.bibliography!;
    if (values.isEmpty) return const Text('Data taksonomi belum tersedia.');
    return Card(
      elevation: 0,
      color: BaseColors.raised,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: values.entries.map((entry) => _infoLine(entry.key, entry.value)).toList(),
        ),
      ),
    );
  }

  Widget _careSection() {
    final care = plant.care;
    if (!care.hasValues) return const Text('Data perawatan belum tersedia dari sumber API.');
    final cards = <Widget>[];
    _addCareCard(cards, 'Cahaya', care.light);
    _addCareCard(cards, 'Kelembapan udara', care.atmosphericHumidity);
    _addCareCard(cards, 'Nutrisi tanah', care.soilNutrients);
    _addCareCard(cards, 'Salinitas tanah', care.soilSalinity);
    _addCareCard(cards, 'Kelembapan tanah', care.soilHumidity);
    if (care.bloomMonths.isNotEmpty) {
      cards.add(Card(
        elevation: 0,
        color: BaseColors.primary50,
        child: ListTile(
          title: const Text('Bulan berbunga'),
          subtitle: Text(care.bloomMonths.join(', ')),
        ),
      ));
    }
    return Column(children: cards);
  }

  void _addCareCard(List<Widget> cards, String title, double? value) {
    if (value != null) cards.add(CareCard(title: title, value: value));
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget _infoLine(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 110, child: Text(label, style: const TextStyle(color: BaseColors.textSecondary))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
