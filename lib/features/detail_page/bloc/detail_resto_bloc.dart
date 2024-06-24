import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:madang/features/detail_page/models/detail_resto_model.dart';
import 'package:madang/features/detail_page/repository/detail_resto_repository.dart';
import 'package:meta/meta.dart';

import '../../../constant/state.dart';

part 'detail_resto_event.dart';
part 'detail_resto_state.dart';

class DetailRestoBloc extends Bloc<DetailRestoEvent, DetailRestoState> {
  final DetailRestoRepository _repository;
  DetailRestoBloc(this._repository) : super(DetailRestoState()) {
    on<DetailRestoEvent>((event, emit) {});
    on<OnGetDetailRestoEvent>(_getDetailResto);
    on<OnAddReviewEvent>(_addReview);
  }

  void _getDetailResto(
    OnGetDetailRestoEvent event,
    Emitter<DetailRestoState> emit,
  ) async {
    emit(state.copyWith(status: DetailStatusState.loading));
    try {
      final data = await _repository.getDetailResto(event.id);
      emit(state.copyWith(
        status: DetailStatusState.hasData,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DetailStatusState.error,
        message: state.message,
      ));
    }
  }

  void _addReview(
    OnAddReviewEvent event,
    Emitter<DetailRestoState> emit,
  ) async {
    emit(state.copyWith(status: DetailStatusState.loading));
    try {
      await _repository.addReview(event.id, event.review);
      final data = await _repository.getDetailResto(event.id);
      emit(state.copyWith(
        status: DetailStatusState.succes,
        data: data,
        message: 'Success add review',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DetailStatusState.error,
        message: state.message,
      ));
    }
  }
}
