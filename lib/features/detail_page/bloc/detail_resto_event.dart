part of 'detail_resto_bloc.dart';

@immutable
sealed class DetailRestoEvent {}

class OnGetDetailRestoEvent extends DetailRestoEvent {
  final String id;

  OnGetDetailRestoEvent({required this.id});
}

class OnAddReviewEvent extends DetailRestoEvent {
  final String id;
  final String review;

  OnAddReviewEvent({required this.id, required this.review});
}
