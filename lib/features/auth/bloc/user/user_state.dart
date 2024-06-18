part of 'user_bloc.dart';

class UserState {
  final String message;
  final GlobalStateStatus status;
  final UserModel? userModel;

  UserState({
    this.message = '',
    this.status = GlobalStateStatus.initial,
    this.userModel,
  });

  UserState copyWith({
    String? message,
    GlobalStateStatus? status,
    UserModel? userModel,
  }) {
    return UserState(
      message: message ?? this.message,
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
    );
  }
}
