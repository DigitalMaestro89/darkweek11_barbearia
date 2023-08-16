// ignore_for_file: unused_field, unused_local_variable

import 'package:dw_barbershop/src/core/constants/local_storage_key.dart';
import 'package:dw_barbershop/src/core/excptions/auth_execption.dart';
import 'package:dw_barbershop/src/core/excptions/service_exception.dart';

import 'package:dw_barbershop/src/core/fp/either.dart';

import 'package:dw_barbershop/src/core/fp/nil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/user/user_repository.dart';
import './user_login_service.dart';

class UserLoginServiceImpl implements UserLoginService {
  final UserRepository _userRepository;

  UserLoginServiceImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<ServiceException, Nil>> execute(
      String email, String password) async {
    final loginResult = await _userRepository.login(email, password);

    switch (loginResult) {
      case Success(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageKey.accessToken, accessToken);
        return Success(nil);
      case Failure(:final exception):
        return switch (exception) {
          AuthError() =>
            Failure(ServiceException(messsage: 'Erorr ao realizar login')),
          AuthUnauthorizedException() =>
            Failure(ServiceException(messsage: 'Login ou Senha Inválidos')),
        };
    }
  }
}
