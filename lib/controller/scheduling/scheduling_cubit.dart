import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:bloc/bloc.dart';
import 'package:madang/utils/schedulling/background_service.dart';
import 'package:madang/utils/schedulling/date_time_helper.dart';

part 'scheduling_state.dart';

class SchedulingCubit extends Cubit<SchedulingState> {
  SchedulingCubit() : super(SchedulingState());

  Future<bool> scheduledResto(bool value) async {
    emit(state.copyWith(
        isScheduled: value, status: SchedulingStatusState.succes));
    if (state.isScheduled) {
      print('Scheduling resto active');

      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Scheduling Canceled');
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
