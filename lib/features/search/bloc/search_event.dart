part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class OnGetSearchEvent extends SearchEvent {
  final String query;

  OnGetSearchEvent({required this.query});
}
