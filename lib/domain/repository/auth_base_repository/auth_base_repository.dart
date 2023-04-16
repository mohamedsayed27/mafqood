import 'package:dartz/dartz.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../entities/auth_entity.dart';
import '../../usecases/auth_usecases/login_usecase.dart';
import '../../usecases/auth_usecases/register_usecase.dart';
import '../../usecases/auth_usecases/reset_password_usecase.dart';
import '../../usecases/auth_usecases/verify_phone.dart';

abstract class AuthenticationBaseRepository {
  Future<Either<AuthErrorException, AuthenticationEntity>> login(LoginParameter loginParameter);

  Future<Either<AuthErrorException, AuthenticationEntity>> register(RegisterParameter registerParameter);

  Future<Either<AuthErrorException, AuthenticationEntity>> verifyPhone(VerifyPhoneParameter parameters);

  Future<Either<AuthErrorException, AuthenticationEntity>> forgetPassword({required String phone});

  Future<Either<AuthErrorException, AuthenticationEntity>> resetPassword(ResetPasswordParameters parameters);
}
