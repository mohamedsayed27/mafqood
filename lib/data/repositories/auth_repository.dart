import 'package:dartz/dartz.dart';
import 'package:mafqood/data/data_source/auth_remote_data_source.dart';
import 'package:mafqood/domain/entities/auth_entity.dart';
import 'package:mafqood/domain/usecases/auth_usecases/login_usecase.dart';
import 'package:mafqood/domain/usecases/auth_usecases/reset_password_usecase.dart';
import 'package:mafqood/domain/usecases/auth_usecases/verify_phone.dart';

import '../../core/error/auth_error_exception.dart';
import '../../domain/repository/auth_base_repository/auth_base_repository.dart';
import '../../domain/usecases/auth_usecases/register_usecase.dart';

class AuthenticationRepository extends AuthenticationBaseRepository {
  final BaseAuthenticationRemoteDataSource baseAuthenticationRemoteDataSource;

  AuthenticationRepository({required this.baseAuthenticationRemoteDataSource});

  @override
  Future<Either<ErrorException, AuthenticationEntity>> login(LoginParameter loginParameter) async {

    try {
      final response = await baseAuthenticationRemoteDataSource.login(loginParameter);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(ErrorException(
        error.authErrorModel,
      ));
    }
  }

  @override
  Future<Either<ErrorException, AuthenticationEntity>> register(RegisterParameter registerParameter) async {

    try {
      final response = await baseAuthenticationRemoteDataSource.register(
          registerParameter
      );
      return Right(response);
    } on ErrorException catch (error) {
      return Left(ErrorException(
        error.authErrorModel,
      ));
    }
  }

  @override
  Future<Either<ErrorException, AuthenticationEntity>> verifyPhone(VerifyPhoneParameter parameters) async {

    try {
      final response = await baseAuthenticationRemoteDataSource.verifyPhone(parameters);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(ErrorException(
        error.authErrorModel,
      ));
    }
  }

  @override
  Future<Either<ErrorException, AuthenticationEntity>> forgetPassword({required String phone}) async{

    try {
      final response = await baseAuthenticationRemoteDataSource.forgetPassword(phone: phone);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(ErrorException(
        error.authErrorModel,
      ));
    }
  }

  @override
  Future<Either<ErrorException, AuthenticationEntity>> resetPassword(ResetPasswordParameters parameters) async{

    try {
      final response = await baseAuthenticationRemoteDataSource.resetPassword(parameters);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(ErrorException(
        error.authErrorModel,
      ));
    }
  }

  
}
