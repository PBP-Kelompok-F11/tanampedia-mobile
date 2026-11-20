import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/base_colors.dart';

class CareCard extends StatelessWidget {
  const CareCard({required this.title, required this.value, super.key});

  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    double progress = value / 10;
    if (progress < 0) {
      progress = 0;
    }
    if (progress > 1) {
      progress = 1;
    }
    return Card(
      elevation: 0,
      color: BaseColors.primary50,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600))),
                Text('${value.toStringAsFixed(1)}/10'),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(8),
              color: BaseColors.primary500,
              backgroundColor: BaseColors.primary200,
            ),
          ],
        ),
      ),
    );
  }
}
