import 'plant.dart';

class PlantListResponse {
  const PlantListResponse({
    required this.plants,
    required this.page,
    required this.perPage,
    required this.total,
    required this.hasNext,
    required this.hasPrevious,
  });

  final List<Plant> plants;
  final int page;
  final int perPage;
  final int? total;
  final bool hasNext;
  final bool hasPrevious;

  factory PlantListResponse.fromJson(Map<String, dynamic> json) {
    final rawResults = json['results'] ?? json['data'];
    final results = <Plant>[];
    if (rawResults is List) {
      for (final item in rawResults) {
        if (item is Map<String, dynamic>) {
          results.add(Plant.fromJson(item));
        }
      }
    }

    final meta = json['meta'];
    final metaMap = <String, dynamic>{};
    if (meta is Map<String, dynamic>) {
      metaMap.addAll(meta);
    }

    int currentPage = _int(metaMap['page']) ?? 1;
    int currentPerPage = _int(metaMap['per_page']) ?? results.length;
    int? currentTotal = _int(metaMap['total']);
    bool currentHasNext = metaMap['has_next'] == true;
    bool currentHasPrevious = metaMap['has_previous'] == true;

    currentTotal ??= _int(metaMap['total_count']);
    if (currentPerPage == 0) {
      currentPerPage = results.length;
    }
    if (!currentHasNext && currentTotal != null) {
      currentHasNext = currentPage * currentPerPage < currentTotal;
    }
    if (!currentHasPrevious) {
      currentHasPrevious = currentPage > 1;
    }

    return PlantListResponse(
      plants: results,
      page: currentPage,
      perPage: currentPerPage,
      total: currentTotal,
      hasNext: currentHasNext,
      hasPrevious: currentHasPrevious,
    );
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
}
