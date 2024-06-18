import 'package:bloc/bloc.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/auth/models/user_model.dart';
import 'package:madang/features/auth/repository/firebase_auth_repo.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseAuthRepo _authRepo;

  UserBloc(this._authRepo) : super(UserState()) {
    on<UserEvent>((event, emit) {});
    on<OnGetUserEvent>((event, emit) async {
      emit(state.copyWith(status: GlobalStateStatus.loading));
      try {
        final user = await _authRepo.getUser();
        emit(state.copyWith(
          status: GlobalStateStatus.succes,
          userModel: user,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: GlobalStateStatus.error,
          message: state.message,
        ));
      }
    });
  }
}
