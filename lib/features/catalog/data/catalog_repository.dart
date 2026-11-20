import 'catalog_api.dart';
import 'models/plant.dart';
import 'models/plant_list_response.dart';

class CatalogRepository {
  CatalogRepository({CatalogApi? api}) : _api = api ?? CatalogApi();

  final CatalogApi _api;

  Future<PlantListResponse> getPlants({
    String query = '',
    String sort = 'name_asc',
    int page = 1,
  }) {
    return _api.getPlants(query: query, sort: sort, page: page);
  }

  Future<Plant> getPlantDetail(String slug) {
    return _api.getPlantDetail(slug);
  }
}
