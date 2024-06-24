part of 'home_bloc.dart';

class HomeState {
  final String message;
  final HomeStatusState status;
  final List<Restaurants>? data;

  HomeState({
    this.message = '',
    this.status = HomeStatusState.initial,
    this.data,
  });

  HomeState copyWith({
    String? message,
    HomeStatusState? status,
    List<Restaurants>? data,
  }) {
    return HomeState(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
