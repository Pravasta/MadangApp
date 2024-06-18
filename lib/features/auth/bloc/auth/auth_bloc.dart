import 'package:bloc/bloc.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/auth/repository/firebase_auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthRepo _authRepo;

  AuthBloc(this._authRepo) : super(AuthState()) {
    on<AuthEvent>((event, emit) {});
    on<Authenticated>(_authMethod);
    on<UnAuthenticated>(_unAuthMethod);
  }

  void _authMethod(
    Authenticated event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: GlobalStateStatus.loading));
    try {
      final call = await _authRepo.isSignIn();
      final user = await _authRepo.getCurrentUserId();
      if (user != null) {
        emit(state.copyWith(
          status: GlobalStateStatus.succes,
          isLogin: call,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: GlobalStateStatus.error,
        message: state.message,
      ));
    }
  }

  void _unAuthMethod(
    UnAuthenticated event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: GlobalStateStatus.loading));
    try {
      final data = await _authRepo.signOut();
      emit(state.copyWith(
        status: GlobalStateStatus.succes,
        message: 'Succes Logout',
        isLogin: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: GlobalStateStatus.error,
        message: state.message,
      ));
    }
  }
}
