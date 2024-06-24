part of 'favorite_bloc.dart';

class FavoriteState {
  final String message;
  final FavoriteStatusState status;
  final List<Restaurants>? data;

  FavoriteState({
    this.message = '',
    this.status = FavoriteStatusState.initial,
    this.data,
  });

  FavoriteState copyWith({
    String? message,
    FavoriteStatusState? status,
    List<Restaurants>? data,
  }) {
    return FavoriteState(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
