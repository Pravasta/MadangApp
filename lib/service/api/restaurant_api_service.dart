import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:madang/common/endpoint/app_endpoint.dart';
import 'package:madang/features/detail_page/models/detail_resto_model.dart';
import 'package:madang/features/home/models/restaurant_api.dart';
import 'package:madang/features/search/models/search_restaurant_response.dart';

class RestaurantApiService {
  final AppEndPoint _appEndPoint;
  final http.Client _client;

  RestaurantApiService({
    required AppEndPoint appEndPoint,
    required http.Client client,
  })  : _appEndPoint = appEndPoint,
        _client = client;

  Future<RestaurantResponse> getAllResto() async {
    final response = await _client.get(_appEndPoint.getListRestaurant());
    try {
      if (response.statusCode == 200) {
        final data = restaurantResponseFromJson(response.body);
        return data;
      } else {
        throw Exception('Failed get data API');
      }
    } on SocketException catch (_) {
      throw Exception('Tidak terdapat jaringan Internet');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Restaurants> getRandomResto() async {
    final response = await _client.get(_appEndPoint.getListRestaurant());
    try {
      if (response.statusCode == 200) {
        final random = Random();
        final data = restaurantResponseFromJson(response.body).restaurants;
        if (data!.isNotEmpty) {
          Restaurants call = data[random.nextInt(data.length)];
          return call;
        }
        throw '';
      } else {
        throw Exception('Failed get data API');
      }
    } on SocketException catch (_) {
      throw Exception('Tidak terdapat jaringan Internet');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DetailRestaurantResponse> getDetailResto(String id) async {
    final response = await _client.get(_appEndPoint.getDetailRestaurant(id));

    try {
      if (response.statusCode == 200) {
        final data = detailRestaurantResponseFromJson(response.body);
        return data;
      } else {
        throw Exception('Failed get data API');
      }
    } on SocketDirection catch (_) {
      throw Exception('Tidak terdapat jaringan Internet');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SearchRestaurantResponse> getSearchResto(String query) async {
    final response = await _client.get(_appEndPoint.getSearchRestaurant(query));

    try {
      if (response.statusCode == 200) {
        final call = searchRestaurantResponseFromJson(response.body);
        return call;
      } else {
        throw Exception('Failed get data API');
      }
    } on SocketException catch (_) {
      throw Exception('Tidak terdapat jaringan internet');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addReview(String id, String name, String review) async {
    try {
      final response = await _client.post(
        _appEndPoint.postAddReview(),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id': id,
          'name': name,
          'review': review,
        }),
      );

      if (response.statusCode == 200) {
        final call = jsonDecode(response.body);
        return call;
      } else {
        throw Exception('Failed to add a review');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
