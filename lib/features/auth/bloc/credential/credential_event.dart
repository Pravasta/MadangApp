part of 'credential_bloc.dart';

@immutable
sealed class CredentialEvent {}

class OnLoginEvent extends CredentialEvent {
  final String email;

  final String password;

  OnLoginEvent({required this.email, required this.password});
}

class OnRegisterEvent extends CredentialEvent {
  final String username;
  final String email;
  final String password;

  OnRegisterEvent(
      {required this.username, required this.email, required this.password});
}

class OnGoogleSignIn extends CredentialEvent {}
