// To parse this JSON data, do
//
//     final searchRestaurantResponse = searchRestaurantResponseFromJson(jsonString);

import 'dart:convert';

SearchRestaurantResponse searchRestaurantResponseFromJson(String str) =>
    SearchRestaurantResponse.fromJson(json.decode(str));

String searchRestaurantResponseToJson(SearchRestaurantResponse data) =>
    json.encode(data.toJson());

class SearchRestaurantResponse {
  bool error;
  int founded;
  List<RestaurantSearch>? restaurants;

  SearchRestaurantResponse({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory SearchRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantResponse(
        error: json["error"],
        founded: json["founded"],
        restaurants: json['restaurants'] == null
            ? []
            : List<RestaurantSearch>.from(
                json["restaurants"].map((x) => RestaurantSearch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "founded": founded,
        "restaurants": restaurants == null
            ? []
            : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
      };
}

class RestaurantSearch {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  RestaurantSearch({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory RestaurantSearch.fromJson(Map<String, dynamic> json) =>
      RestaurantSearch(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
