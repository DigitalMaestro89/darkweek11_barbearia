import 'package:dw_barbershop/src/core/excptions/auth_execption.dart';
import 'package:dw_barbershop/src/core/excptions/repository_execption.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';

import '../../model/user_model.dart';

abstract interface class UserRepository {
  Future<Either<AuthExecption, String>> login(String email, String password);

  Future<Either<RepositoryExecption, UserModel>> me();
}