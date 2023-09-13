import 'package:dw_barbershop/src/core/excptions/repository_execption.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/providers/application_providers.dart';
import 'package:dw_barbershop/src/model/schedule_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_schedule_vm.g.dart';

@riverpod
class EmployeeScheduleVM extends _$EmployeeScheduleVM {
  @override
  Future<List<ScheduleModel>> build(int userId, DateTime date) async =>
      switch (await _getSchedules(userId, date)) {
        Success(value: final schedules) => schedules,
        Failure(:final exception) => throw Exception(exception),
      };

  Future<void> changeDate(int userId, DateTime date) async =>
      state = switch (await _getSchedules(userId, date)) {
        Success(value: final schedules) => AsyncData(schedules),
        Failure(:final exception) =>
          AsyncError(Exception(exception), StackTrace.current),
      };

  Future<Either<RepositoryExecption, List<ScheduleModel>>> _getSchedules(
    int userId,
    DateTime date,
  ) =>
      ref
          .read(scheduleRepositoryProvider)
          .findScheduleByDate((userId: userId, date: date));
}
