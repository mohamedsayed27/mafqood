import 'package:dartz/dartz.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../entities/auth_entity.dart';
import '../../usecases/auth_usecases/register_usecase.dart';

abstract class AuthenticationBaseRepository {
  Future<Either<AuthErrorException, AuthenticationEntity>> login({required String password, required String phone});

  Future<Either<AuthErrorException, AuthenticationEntity>> register(RegisterParameter registerParameter);

  Future<Either<AuthErrorException, AuthenticationEntity>> verifyPhone({required String code, required String phone});

  Future<Either<AuthErrorException, AuthenticationEntity>> forgetPassword({required String phone});

  Future<Either<AuthErrorException, AuthenticationEntity>> resetPassword({required String password, required String phone, required String code});
}
