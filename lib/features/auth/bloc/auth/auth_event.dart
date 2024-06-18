part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class Authenticated extends AuthEvent {}

class UnAuthenticated extends AuthEvent {}
