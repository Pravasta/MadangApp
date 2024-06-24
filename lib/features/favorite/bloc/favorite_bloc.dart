import 'package:bloc/bloc.dart';
import 'package:madang/features/favorite/repository/favorite_repository.dart';
import 'package:madang/features/home/models/restaurant_api.dart';
import 'package:meta/meta.dart';

import '../../../constant/state.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _repository;

  FavoriteBloc(this._repository) : super(FavoriteState()) {
    on<FavoriteEvent>((event, emit) {});
    on<OnGetAllFavorite>(_onGetAllFavorite);
    on<OnInserFavorite>(_onInsertFavorite);
    on<OnRemoveFavorite>(_onRemoveFavorite);
  }

  void _onGetAllFavorite(
    OnGetAllFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(state.copyWith(status: FavoriteStatusState.loading));
    try {
      final data = await _repository.getListRestoDb();
      if (data.isEmpty) {
        emit(state.copyWith(
          status: FavoriteStatusState.noData,
          message: 'No Data',
        ));
      }
      emit(state.copyWith(
        status: FavoriteStatusState.hasData,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FavoriteStatusState.error,
        message: state.message,
      ));
    }
  }

  void _onInsertFavorite(
    OnInserFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(state.copyWith(status: FavoriteStatusState.loading));
    try {
      await _repository.insertFavorite(event.restaurants);
      final data = await _repository.getListRestoDb();
      emit(state.copyWith(
          status: FavoriteStatusState.hasData, data: data, message: 'Success'));
    } catch (e) {
      emit(state.copyWith(
        status: FavoriteStatusState.error,
        message: state.message,
      ));
    }
  }

  void _onRemoveFavorite(
    OnRemoveFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(state.copyWith(status: FavoriteStatusState.loading));
    try {
      await _repository.removeFavorite(event.id);
      final data = await _repository.getListRestoDb();
      emit(state.copyWith(
        status: FavoriteStatusState.hasData,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FavoriteStatusState.error,
        message: state.message,
      ));
    }
  }
}
