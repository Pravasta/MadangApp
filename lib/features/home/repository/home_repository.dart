import 'package:madang/features/home/models/restaurant_api.dart';
import 'package:madang/service/api/restaurant_api_service.dart';

abstract class HomeRepository {
  Future<List<Restaurants>?> getAllRestaurant();
}

class HomeRepositoryImpl implements HomeRepository {
  final RestaurantApiService _service;

  HomeRepositoryImpl({
    required RestaurantApiService service,
  }) : _service = service;

  @override
  Future<List<Restaurants>?> getAllRestaurant() async {
    try {
      final call = await _service.getAllResto();
      if (call.restaurants!.isEmpty) {
        return [];
      }
      return call.restaurants;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
