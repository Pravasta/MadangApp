import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/auth/models/user_model.dart';
import 'package:madang/features/auth/repository/firebase_auth_repo.dart';
import 'package:meta/meta.dart';

part 'credential_event.dart';
part 'credential_state.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  final FirebaseAuthRepo _authRepo;

  CredentialBloc(this._authRepo) : super(CredentialState()) {
    on<CredentialEvent>((event, emit) {});
    on<OnLoginEvent>(onLoginMethod);
    on<OnRegisterEvent>(onRegisterMethod);
  }

  void onLoginMethod(
    OnLoginEvent event,
    Emitter<CredentialState> emit,
  ) async {
    emit(state.copyWith(status: GlobalStateStatus.loading));
    try {
      final data = await _authRepo.login(event.email, event.password);
      emit(state.copyWith(
        status: GlobalStateStatus.succes,
        data: data,
        message: 'Success',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: GlobalStateStatus.error,
        message: state.message,
      ));
    }
  }

  void onRegisterMethod(
    OnRegisterEvent event,
    Emitter<CredentialState> emit,
  ) async {
    emit(state.copyWith(status: GlobalStateStatus.loading));
    try {
      final data = await _authRepo.register(
        event.username,
        event.email,
        event.password,
      );
      emit(state.copyWith(
        status: GlobalStateStatus.succes,
        data: data,
        message: 'Success',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: GlobalStateStatus.error,
        message: state.message,
      ));
    }
  }
}
