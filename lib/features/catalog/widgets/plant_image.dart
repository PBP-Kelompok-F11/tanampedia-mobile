import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/base_colors.dart';

class PlantImage extends StatelessWidget {
  const PlantImage({required this.url, this.borderRadius = 16, super.key});

  final String? url;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final imageUrl = url;
    Widget image = _placeholder();
    if (imageUrl != null && imageUrl.isNotEmpty) {
      image = Image.network(
        imageUrl,
        key: ValueKey(imageUrl),
        fit: BoxFit.cover,
        webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
        errorBuilder: (_, error, _) {
          debugPrint('PlantImage gagal memuat $imageUrl -> $error');
          return _placeholder();
        },
        loadingBuilder: (context, child, progress) {
          if (progress == null) {
            return child;
          }
          return _placeholder(loading: true);
        },
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: AspectRatio(aspectRatio: 1, child: image),
    );
  }

  Widget _placeholder({bool loading = false}) {
    Widget content = const Icon(Icons.local_florist_rounded, size: 42, color: BaseColors.primary600);
    if (loading) {
      content = const SizedBox(
        width: 28,
        height: 28,
        child: CircularProgressIndicator(strokeWidth: 2.5, color: BaseColors.primary600),
      );
    }
    return Container(
      color: BaseColors.primary100,
      alignment: Alignment.center,
      child: content,
    );
  }
}
