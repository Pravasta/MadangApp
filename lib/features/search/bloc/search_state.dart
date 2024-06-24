part of 'search_bloc.dart';

class SearchState {
  final String message;
  final SearchStatusState status;
  final List<RestaurantSearch>? data;

  SearchState({
    this.message = '',
    this.status = SearchStatusState.initial,
    this.data,
  });

  SearchState copyWith({
    String? message,
    SearchStatusState? status,
    List<RestaurantSearch>? data,
  }) {
    return SearchState(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
