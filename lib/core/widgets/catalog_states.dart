import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/base_colors.dart';

class CatalogErrorState extends StatelessWidget {
  const CatalogErrorState({required this.message, required this.onRetry, super.key});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off_rounded, size: 52, color: BaseColors.primary600),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Coba lagi'),
            ),
          ],
        ),
      ),
    );
  }
}

class CatalogEmptyState extends StatelessWidget {
  const CatalogEmptyState({required this.hasQuery, super.key});

  final bool hasQuery;

  @override
  Widget build(BuildContext context) {
    String message = 'Belum ada tanaman untuk ditampilkan.';
    if (hasQuery) {
      message = 'Tidak ada tanaman yang cocok dengan pencarianmu.';
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.local_florist_rounded, size: 52, color: BaseColors.primary400),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
