import 'package:tanampedia/core/constants/api_constants.dart';
import 'package:tanampedia/core/network/api_client.dart';
import 'package:tanampedia/features/catalog/data/models/plant.dart';
import 'package:tanampedia/features/catalog/data/models/plant_list_response.dart';

class CatalogApi {
  CatalogApi({ApiClient? client}) : _client = client ?? ApiClient();

  final ApiClient _client;

  Future<PlantListResponse> getPlants({
    String query = '',
    String sort = 'name_asc',
    int page = 1,
  }) async {
    final trimmedQuery = query.trim();
    final parameters = <String, String>{
      'page': page.toString(),
      'sort': sort,
    };
    if (trimmedQuery.isNotEmpty) {
      parameters['q'] = trimmedQuery;
    }

    final json = await _client.getJson(
      ApiConstants.catalogPlantsPath,
      queryParameters: parameters,
    );
    return PlantListResponse.fromJson(json);
  }

  Future<Plant> getPlantDetail(String slug) async {
    final json = await _client.getJson(
      ApiConstants.catalogPlantDetailPath(slug),
    );
    final data = json['data'];
    if (data is Map<String, dynamic>) {
      return Plant.fromJson(data);
    }
    return Plant.fromJson(json);
  }
}
