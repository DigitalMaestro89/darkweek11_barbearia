import 'package:dw_barbershop/src/core/excptions/service_exception.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';

import '../../core/fp/nil.dart';

abstract interface class UserRegisterService {
  Future<Either<ServiceException, Nil>> execute(
      ({String name, String email, String password}) userData);
}
