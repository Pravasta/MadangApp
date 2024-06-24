import 'package:bloc/bloc.dart';
import 'package:madang/utils/preferences/preferences_helper.dart';

part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  final PreferencesHelper _preferencesHelper;

  PreferencesCubit(this._preferencesHelper) : super(PreferencesState());

  void getTheme() async {
    final data = await _preferencesHelper.isDarkTheme;
    if (state.themeState == false) {
      emit(state.copyWith(
        themeState: data,
        status: PreferencesStatusState.success,
      ));
    } else {
      emit(state.copyWith(
        themeState: data,
        status: PreferencesStatusState.success,
      ));
    }
  }

  void getDailyResto() async {
    final data = await _preferencesHelper.dailyNotif;
    emit(state.copyWith(
      dailyState: data,
      status: PreferencesStatusState.success,
    ));
  }

  void enabledDarkTheme(bool value) {
    _preferencesHelper.setDarkTheme(value);
    state.copyWith(themeState: value);
    getTheme();
  }

  void enabledDailyResto(bool value) {
    _preferencesHelper.setDailyNotif(value);
    getDailyResto();
  }
}
