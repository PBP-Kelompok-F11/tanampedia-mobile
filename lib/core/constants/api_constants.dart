abstract final class ApiConstants {
  // Mobile mengambil data melalui Django REST Framework.
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8000',
  );

  static const String catalogPlantsPath = '/api/catalog/plants/';

  static String catalogPlantDetailPath(String slug) {
    return '$catalogPlantsPath$slug/';
  }
}
