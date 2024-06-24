import 'dart:convert';

RestaurantResponse restaurantResponseFromJson(String str) =>
    RestaurantResponse.fromJson(json.decode(str));

String restaurantResponseToJson(RestaurantResponse data) =>
    json.encode(data.toJson());

class RestaurantResponse {
  bool error;
  String message;
  int count;
  List<Restaurants>? restaurants;

  RestaurantResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantResponse(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: json['restaurants'] == null
            ? []
            : List<Restaurants>.from(
                json["restaurants"].map((x) => Restaurants.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": restaurants == null
            ? []
            : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
      };
}

class Restaurants {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  Restaurants({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
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
