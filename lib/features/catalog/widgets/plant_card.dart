import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/base_colors.dart';
import 'package:tanampedia/features/catalog/data/models/plant.dart';
import 'plant_image.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({required this.plant, required this.onTap, super.key});

  final Plant plant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: BaseColors.raised,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: BaseColors.border),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlantImage(url: plant.imageUrl, borderRadius: 12),
              const SizedBox(height: 10),
              Text(
                plant.displayName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              if (plant.scientificName != null) ...[
                const SizedBox(height: 4),
                Text(
                  plant.scientificName!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
                ),
              ],
              if (plant.family != null) ...[
                const SizedBox(height: 6),
                Text(
                  plant.family!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: BaseColors.textSecondary),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
