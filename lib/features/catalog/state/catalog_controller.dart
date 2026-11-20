import 'package:flutter/foundation.dart';
import 'package:tanampedia/features/catalog/data/catalog_repository.dart';
import 'package:tanampedia/features/catalog/data/models/plant.dart';

enum CatalogStatus { initial, loading, success, loadingMore, error }

class CatalogController extends ChangeNotifier {
  CatalogController({CatalogRepository? repository}) : _repository = repository ?? CatalogRepository();

  final CatalogRepository _repository;
  final List<Plant> plants = [];
  CatalogStatus status = CatalogStatus.initial;
  String errorMessage = '';
  String query = '';
  String sort = 'name_asc';
  int page = 1;
  int? total;
  bool hasNext = false;

  Future<void> loadPlants({bool refresh = true}) async {
    if (!refresh && (!hasNext || status == CatalogStatus.loadingMore)) {
      return;
    }
    if (refresh) {
      page = 1;
      status = CatalogStatus.loading;
      plants.clear();
    } else {
      status = CatalogStatus.loadingMore;
    }
    errorMessage = '';
    notifyListeners();

    try {
      final response = await _repository.getPlants(query: query, sort: sort, page: page);
      plants.addAll(response.plants);
      page = response.page;
      total = response.total;
      hasNext = response.hasNext;
      status = CatalogStatus.success;
    } on Exception catch (error) {
      errorMessage = error.toString();
      status = CatalogStatus.error;
    }
    notifyListeners();
  }

  Future<void> applyQuery(String value) async {
    query = value.trim();
    await loadPlants();
  }

  Future<void> applySort(String value) async {
    sort = value;
    await loadPlants();
  }
}
