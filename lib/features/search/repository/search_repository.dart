import 'package:madang/features/search/models/search_restaurant_response.dart';
import 'package:madang/service/api/restaurant_api_service.dart';

abstract class SearchRepository {
  Future<List<RestaurantSearch>?> getAllSearchResto(String query);
}

class SearchRepositoryImpl implements SearchRepository {
  final RestaurantApiService _service;

  SearchRepositoryImpl({
    required RestaurantApiService service,
  }) : _service = service;

  @override
  Future<List<RestaurantSearch>?> getAllSearchResto(String query) async {
    try {
      final call = await _service.getSearchResto(query);
      if (call.restaurants!.isEmpty) {
        return [];
      }
      return call.restaurants;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
