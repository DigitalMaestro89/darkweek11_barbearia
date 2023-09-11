import 'package:dw_barbershop/src/features/schedule/schedule_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_vm.g.dart';

@riverpod
class ScheduleVm extends _$ScheduleVm {
  @override
  ScheduleState build() => ScheduleState.initial();

  void hourSelect(int hour) {
    if (hour == state.scheduleHour) {
      state = state.copyWith(
        scheduleHour: () => null,
      );
    } else {
      state = state.copyWith(
        scheduleHour: () => hour,
      );
    }
  }

  void deteSelecte(DateTime date) {
    state = state.copyWith(scheduleDate: () => date);
  }
}
