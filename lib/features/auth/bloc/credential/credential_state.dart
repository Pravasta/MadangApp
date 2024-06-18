part of 'credential_bloc.dart';

class CredentialState {
  final String message;
  final UserModel? data;
  final GlobalStateStatus status;

  CredentialState({
    this.message = '',
    this.data,
    this.status = GlobalStateStatus.initial,
  });

  CredentialState copyWith({
    String? message,
    UserModel? data,
    GlobalStateStatus? status,
  }) {
    return CredentialState(
      message: message ?? this.message,
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
}
