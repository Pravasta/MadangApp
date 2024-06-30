part of 'scheduling_cubit.dart';

enum SchedulingStatusState { initial, succes, error }

class SchedulingState {
  final bool isScheduled;
  final SchedulingStatusState status;

  SchedulingState({
    this.isScheduled = false,
    this.status = SchedulingStatusState.initial,
  });

  SchedulingState copyWith({
    bool? isScheduled,
    SchedulingStatusState? status,
  }) {
    return SchedulingState(
      isScheduled: isScheduled ?? this.isScheduled,
      status: status ?? this.status,
    );
  }
}
