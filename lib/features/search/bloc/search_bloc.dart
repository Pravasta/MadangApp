import 'package:bloc/bloc.dart';
import 'package:madang/features/search/models/search_restaurant_response.dart';
import 'package:madang/features/search/repository/search_repository.dart';
import 'package:meta/meta.dart';
import '../../../constant/state.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _repository;

  SearchBloc(this._repository) : super(SearchState()) {
    on<SearchEvent>((event, emit) {});
    on<OnGetSearchEvent>(_getDataSearchResto);
  }

  void _getDataSearchResto(
    OnGetSearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(status: SearchStatusState.loading));
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      final data = await _repository.getAllSearchResto(event.query);
      if (data!.isEmpty) {
        emit(state.copyWith(
          status: SearchStatusState.noData,
          message: 'Tidak ditemukan data',
        ));
      } else {
        emit(state.copyWith(
          status: SearchStatusState.hasData,
          data: data,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: SearchStatusState.error,
        message: state.message,
      ));
    }
  }
}
