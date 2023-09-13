import 'package:dw_barbershop/src/core/excptions/repository_execption.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/fp/nil.dart';
import 'package:dw_barbershop/src/model/schedule_model.dart';

abstract interface class ScheduleRepository {
  Future<Either<RepositoryExecption, Nil>> sheduleClient(
    ({
      int barbershopId,
      int userId,
      String clientName,
      DateTime date,
      int time
    }) scheduleData
  );

  Future<Either<RepositoryExecption, List<ScheduleModel>>> findScheduleByDate(
    ({
      DateTime date,
      int userId,
    }) filter );
}