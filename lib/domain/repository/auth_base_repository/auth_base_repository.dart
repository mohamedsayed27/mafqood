import 'package:dartz/dartz.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../entities/auth_entity.dart';
import '../../usecases/auth_usecases/login_usecase.dart';
import '../../usecases/auth_usecases/register_usecase.dart';
import '../../usecases/auth_usecases/reset_password_usecase.dart';
import '../../usecases/auth_usecases/verify_phone.dart';

abstract class AuthenticationBaseRepository {
  Future<Either<ErrorException, AuthenticationEntity>> login(LoginParameter loginParameter);

  Future<Either<ErrorException, AuthenticationEntity>> register(RegisterParameter registerParameter);

  Future<Either<ErrorException, AuthenticationEntity>> verifyPhone(VerifyPhoneParameter parameters);

  Future<Either<ErrorException, AuthenticationEntity>> forgetPassword({required String phone});

  Future<Either<ErrorException, AuthenticationEntity>> resetPassword(ResetPasswordParameters parameters);
}
