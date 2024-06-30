import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:madang/common/endpoint/app_endpoint.dart';
import 'package:madang/features/detail_page/models/detail_resto_model.dart';
import 'package:madang/service/api/restaurant_api_service.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group(
    'Detail Api',
    () {
      late RestaurantApiService service;
      late MockClient mockClient;

      setUp(() {
        mockClient = MockClient();
        service = RestaurantApiService(
          appEndPoint: AppEndPoint('restaurant-api.dicoding.dev'),
          client: mockClient,
        );
      });

      test(
        'test detail Resto',
        () async {
          String id = 'rqdv5juczeskfw1e867';
          final mockResponse = '''
        "id": $id,
        "name": "Melting Pot",
        "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...",
        "city": "Medan",
        "address": "Jln. Pandeglang no 19",
        "pictureId": "14",
        "categories": [
            {
                "name": "Italia"
            },
            {
                "name": "Modern"
            }
        ],
        "menus": {
            "foods": [
                {
                    "name": "Paket rosemary"
                },
                {
                    "name": "Toastie salmon"
                }
            ],
            "drinks": [
                {
                    "name": "Es krim"
                },
                {
                    "name": "Sirup"
                }
            ]
        },
        "rating": 4.2,
        "customerReviews": [
            {
                "name": "Ahmad",
                "review": "Tidak rekomendasi untuk pelajar!",
                "date": "13 November 2019"
            }
        ]
      ''';
          when(mockClient.get(
                  Uri.parse('https://restaurant-api.dicoding.dev/detail/$id')))
              .thenAnswer(
            (_) async {
              return http.Response(mockResponse, 200);
            },
          );

          final result = await service.getDetailResto(id);

          expect(result, isA<DetailRestaurantResponse>());
        },
      );
    },
  );
}
