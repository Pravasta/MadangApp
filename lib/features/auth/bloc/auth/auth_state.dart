part of 'auth_bloc.dart';

class AuthState {
  final String message;
  final GlobalStateStatus status;
  final bool isLogin;

  AuthState({
    this.message = '',
    this.status = GlobalStateStatus.initial,
    this.isLogin = false,
  });

  AuthState copyWith({
    String? message,
    GlobalStateStatus? status,
    bool? isLogin,
  }) {
    return AuthState(
      message: message ?? this.message,
      status: status ?? this.status,
      isLogin: isLogin ?? this.isLogin,
    );
  }
}
