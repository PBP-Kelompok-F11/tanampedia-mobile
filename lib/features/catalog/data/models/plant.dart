import 'care_data.dart';

class Plant {
  const Plant({
    required this.slug,
    this.scientificName,
    this.commonName,
    this.family,
    this.genus,
    this.year,
    this.bibliography,
    this.imageUrl,
    this.observations,
    this.sourceUrl,
    this.care = const CareData(),
  });

  final String slug;
  final String? scientificName;
  final String? commonName;
  final String? family;
  final String? genus;
  final int? year;
  final String? bibliography;
  final String? imageUrl;
  final String? observations;
  final String? sourceUrl;
  final CareData care;

  String get displayName {
    if (commonName != null && commonName!.trim().isNotEmpty) {
      return commonName!;
    }
    if (scientificName != null && scientificName!.trim().isNotEmpty) {
      return scientificName!;
    }
    return 'Tanaman tanpa nama';
  }

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      slug: _string(json['slug']) ?? '',
      scientificName: _string(json['scientific_name']),
      commonName: _string(json['common_name']),
      family: _string(json['family']),
      genus: _string(json['genus']),
      year: _int(json['year']),
      bibliography: _string(json['bibliography']),
      imageUrl: _extractImageUrl(json),
      observations: _string(json['observations']),
      sourceUrl: _nestedSourceUrl(json),
      care: CareData.fromJson(_map(json['care'])),
    );
  }

  static String? _string(dynamic value) {
    if (value is String && value.trim().isNotEmpty) {
      return value;
    }
    return null;
  }

  static int? _int(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is num && value is! bool) {
      return value.toInt();
    }
    return null;
  }

  static Map<String, dynamic>? _map(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    }
    return null;
  }

  static String? _extractImageUrl(Map<String, dynamic> json) {
    final directImage = _string(json['image_url']);
    if (directImage != null) {
      return _normalizeImageUrl(directImage);
    }

    final mainImage = _map(json['main_image']);
    final mainImageUrl = _string(mainImage?['image_url']);
    if (mainImageUrl != null) {
      return _normalizeImageUrl(mainImageUrl);
    }

    final mainSpecies = _map(json['main_species']);
    final speciesImageUrl = _string(mainSpecies?['image_url']);
    if (speciesImageUrl != null) {
      return _normalizeImageUrl(speciesImageUrl);
    }

    final speciesImages = _map(mainSpecies?['images']) ?? _map(json['images']);
    if (speciesImages != null) {
      final grouped = _firstImageFromGroups(speciesImages);
      if (grouped != null) {
        return _normalizeImageUrl(grouped);
      }
    }

    final images = json['images'];
    if (images is List && images.isNotEmpty) {
      final firstImage = images.first;
      if (firstImage is String) {
        return _normalizeImageUrl(firstImage);
      }
      if (firstImage is Map<String, dynamic>) {
        final imageUrl = _string(firstImage['url']) ?? _string(firstImage['image_url']);
        if (imageUrl != null) {
          return _normalizeImageUrl(imageUrl);
        }
      }
    }

    return null;
  }

  static String _normalizeImageUrl(String value) {
    final url = value.trim();
    if (url.startsWith('https://')) {
      return url;
    }
    if (url.startsWith('http://')) {
      return 'https://${url.substring(7)}';
    }
    if (url.startsWith('//')) {
      return 'https:$url';
    }
    if (url.startsWith('/')) {
      return 'https://trefle.io$url';
    }
    return 'https://trefle.io/$url';
  }

  static String? _firstImageFromGroups(Map<String, dynamic> groups) {
    for (final group in const ['flower', 'habit', 'leaf', 'fruit', 'bark', 'other']) {
      final items = groups[group];
      if (items is List) {
        for (final item in items) {
          if (item is Map<String, dynamic>) {
            final url = _string(item['image_url']);
            if (url != null) {
              return url;
            }
          }
        }
      }
    }
    return null;
  }

  static String? _nestedSourceUrl(Map<String, dynamic> json) {
    final links = _map(json['links']);
    return _string(links?['self']);
  }
}
