part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

class OnGetAllFavorite extends FavoriteEvent {}

class OnInserFavorite extends FavoriteEvent {
  final Restaurants restaurants;

  OnInserFavorite({required this.restaurants});
}

class OnRemoveFavorite extends FavoriteEvent {
  final String id;

  OnRemoveFavorite({required this.id});
}
