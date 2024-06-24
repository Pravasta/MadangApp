import 'package:madang/features/detail_page/models/detail_resto_model.dart';
import 'package:madang/service/api/restaurant_api_service.dart';
import 'package:madang/service/firebase/firebase_auth_service.dart';

abstract class DetailRestoRepository {
  Future<Restaurant?> getDetailResto(String id);
  Future<void> addReview(String id, String review);
}

class DetailRestoRepositoryImpl implements DetailRestoRepository {
  final RestaurantApiService _service;
  final FirebaseAuthService _authService;

  DetailRestoRepositoryImpl({
    required RestaurantApiService service,
    required FirebaseAuthService authService,
  })  : _service = service,
        _authService = authService;

  @override
  Future<Restaurant?> getDetailResto(String id) async {
    final call = await _service.getDetailResto(id);
    return call.restaurant;
  }

  @override
  Future<void> addReview(String id, String review) async {
    final data = await _authService.getUser();
    await _service.addReview(id, data.username!, review);
  }
}
