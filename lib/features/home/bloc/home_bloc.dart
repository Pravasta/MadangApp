import 'package:bloc/bloc.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/home/models/restaurant_api.dart';
import 'package:madang/features/home/repository/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<OnGetAllRestaurantEvent>(_getAllRestaurant);
  }

  void _getAllRestaurant(
    OnGetAllRestaurantEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatusState.loading));
    try {
      final data = await _repository.getAllRestaurant();
      if (data!.isEmpty) {
        emit(state.copyWith(
          status: HomeStatusState.noData,
          message: 'No Data',
          data: [],
        ));
      } else if (data.isNotEmpty) {
        emit(state.copyWith(
          status: HomeStatusState.hasData,
          data: data,
        ));
      }
    } catch (e) {
      state.copyWith(
        status: HomeStatusState.error,
        message: state.message,
      );
    }
  }
}
