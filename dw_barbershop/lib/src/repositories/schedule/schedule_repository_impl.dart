import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw_barbershop/src/core/excptions/repository_execption.dart';

import 'package:dw_barbershop/src/core/fp/either.dart';

import 'package:dw_barbershop/src/core/fp/nil.dart';
import 'package:dw_barbershop/src/core/restClient/rest_client.dart';

import './schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final RestClient _restClient;

  ScheduleRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<Either<RepositoryExecption, Nil>> sheduleClient(
      ({
        int barbershopId,
        String clientName,
        DateTime date,
        int time,
        int userId
      }) scheduleData) async {
    try {
      await _restClient.auth.post(
        '/schedules',
        data: {
          'barbershop_id': scheduleData.barbershopId,
          'user_id': scheduleData.userId,
          'client_name': scheduleData.clientName,
          'date': scheduleData.date.toIso8601String(),
          'time': scheduleData.time,
        },
      );
      return Success(nil);
    } on DioException catch (e, s) {
      log('Erro ao registrar agendamento', error: e, stackTrace: s);
      return Failure(RepositoryExecption(message: 'Erro ao agendar horário'));
    }
  }
}
