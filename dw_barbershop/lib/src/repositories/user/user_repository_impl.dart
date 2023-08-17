// ignore_for_file: unused_field, unused_local_variable

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dw_barbershop/src/core/excptions/auth_execption.dart';
import 'package:dw_barbershop/src/core/excptions/repository_execption.dart';

import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/restClient/rest_client.dart';
import 'package:dw_barbershop/src/model/user_model.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;

  UserRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<Either<AuthExecption, String>> login(
      String email, String password) async {
    try {
      final Response(:data) = await _restClient.unAuth.post(
        '/auth',
        data: {
          'email': email,
          'password': password,
        },
      );

      return Success(data['access_token']);
    } on DioException catch (e, s) {
      if(e.response != null) {
        final Response(:statusCode) = e.response!;
        if(statusCode == HttpStatus.forbidden) {
          log('Login ou senha inválidos', error: e, stackTrace: s);    
          return Failure(AuthUnauthorizedException());
        }
      }
      log('Erro ao realizar login', error: e, stackTrace: s);
      return Failure(AuthError(message: 'Erro ao realizar login'));
    }
  }

  @override
  Future<Either<RepositoryExecption, UserModel>> me() async {
    final Response(:data) = await _restClient.auth.get('/me');

    
  }
}
