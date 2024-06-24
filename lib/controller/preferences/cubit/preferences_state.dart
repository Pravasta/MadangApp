part of 'preferences_cubit.dart';

enum PreferencesStatusState { initial, failed, success }

class PreferencesState {
  final bool dailyState;
  final bool themeState;

  final PreferencesStatusState status;

  PreferencesState({
    this.dailyState = false,
    this.themeState = false,
    this.status = PreferencesStatusState.initial,
  });

  PreferencesState copyWith({
    bool? dailyState,
    bool? themeState,
    PreferencesStatusState? status,
  }) {
    return PreferencesState(
      dailyState: dailyState ?? this.dailyState,
      themeState: themeState ?? this.themeState,
      status: status ?? this.status,
    );
  }
}
