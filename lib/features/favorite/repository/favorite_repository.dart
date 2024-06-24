import 'package:madang/features/home/models/restaurant_api.dart';
import 'package:madang/utils/db/database_helper.dart';

abstract class FavoriteRepository {
  Future<List<Restaurants>> getListRestoDb();
  Future<void> insertFavorite(Restaurants restaurants);
  Future<void> removeFavorite(String id);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final DatabaseHelper _databaseHelper;

  FavoriteRepositoryImpl({
    required DatabaseHelper databaseHelper,
  }) : _databaseHelper = databaseHelper;

  @override
  Future<List<Restaurants>> getListRestoDb() async {
    final call = await _databaseHelper.getAllRestoDb();
    return call;
  }

  @override
  Future<void> insertFavorite(Restaurants restaurants) async {
    await _databaseHelper.insertFavorite(restaurants);
  }

  @override
  Future<void> removeFavorite(String id) async {
    await _databaseHelper.removeFavorite(id);
  }
}
