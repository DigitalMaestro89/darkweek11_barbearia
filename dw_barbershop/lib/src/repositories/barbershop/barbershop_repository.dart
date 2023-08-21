import 'package:dw_barbershop/src/core/excptions/repository_execption.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/fp/nil.dart';
import 'package:dw_barbershop/src/model/barbershop_model.dart';
import 'package:dw_barbershop/src/model/user_model.dart';

abstract interface class BarbershopRepository {
  Future<Either<RepositoryExecption, BarbershopModel>> getMyBarbershop(UserModel userModel);

  Future<Either<RepositoryExecption, Nil>> save(({
    String name, 
    String email,
    List<String> openingDays,
    List<int> openingHours,
  }) data);
  
}