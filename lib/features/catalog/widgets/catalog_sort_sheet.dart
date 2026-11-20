import 'package:flutter/material.dart';

class CatalogSortSheet extends StatelessWidget {
  const CatalogSortSheet({required this.selectedSort, required this.onSelected, super.key});

  final String selectedSort;
  final ValueChanged<String> onSelected;

  static const options = <Map<String, String>>[
    {'value': 'name_asc', 'label': 'Nama A–Z'},
    {'value': 'name_desc', 'label': 'Nama Z–A'},
    {'value': 'year_asc', 'label': 'Tahun terlama–terbaru'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Urutkan katalog', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            RadioGroup<String>(
              groupValue: selectedSort,
              onChanged: (value) {
                if (value != null) {
                  onSelected(value);
                }
              },
              child: Column(
                children: [
                  for (final option in options)
                    RadioListTile<String>(
                      value: option['value']!,
                      title: Text(option['label']!),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
