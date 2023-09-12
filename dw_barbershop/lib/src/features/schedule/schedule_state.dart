import 'package:flutter/material.dart';
enum ScheduleStateStatus {
  initial,
  success,
  error;
}


class ScheduleState {
  final ScheduleStateStatus status;
  final int? scheduleTime;
  final DateTime? scheduleDate;

  ScheduleState.initial() : this(status: ScheduleStateStatus.initial);

    ScheduleState({
    required this.status,
    this.scheduleTime,
    this.scheduleDate
  });

  
  ScheduleState copyWith({
    ScheduleStateStatus? status,
    ValueGetter<int?>? scheduleHour,
    ValueGetter<DateTime?>? scheduleDate    
  }) {
    return ScheduleState(
          status: status ?? this.status,
      scheduleTime: scheduleHour != null ? scheduleHour() : scheduleTime,
      scheduleDate: scheduleDate != null ? scheduleDate() : this.scheduleDate
    );
  }
}
