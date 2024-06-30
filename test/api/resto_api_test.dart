import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:madang/common/endpoint/app_endpoint.dart';
import 'package:madang/features/home/models/restaurant_api.dart';
import 'package:madang/service/api/restaurant_api_service.dart';
import 'package:http/http.dart' as http;

void main() {
  test(
    'Get data resto',
    () async {
      final client = MockClient(
        (request) async {
          final response = {
            "error": false,
            "message": "success",
            "count": 20,
            "restaurants": []
          };

          return http.Response(json.encode(response), 200);
        },
      );

      final result = await RestaurantApiService(
        client: client,
        appEndPoint: AppEndPoint('restaurant-api.dicoding.dev'),
      ).getAllResto();

      expect(result, isA<RestaurantResponse>());
    },
  );
}
