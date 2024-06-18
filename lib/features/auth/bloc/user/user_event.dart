part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class OnGetUserEvent extends UserEvent {}
