import 'package:dio/dio.dart';
import 'package:mafqood/core/network/api_end_points.dart';
import 'package:mafqood/data/models/auth_model.dart';
import 'package:mafqood/domain/usecases/auth_usecases/login_usecase.dart';
import 'package:mafqood/domain/usecases/auth_usecases/register_usecase.dart';
import 'package:mafqood/domain/usecases/auth_usecases/reset_password_usecase.dart';
import 'package:mafqood/domain/usecases/auth_usecases/verify_phone.dart';

import '../../core/error/auth_error_exception.dart';
import '../../core/network/dio_helper.dart';
import '../../core/network/error_message_model.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<AuthenticationModel> login(LoginParameter loginParameter);

  Future<AuthenticationModel> register(RegisterParameter registerParameter);

  Future<AuthenticationModel> verifyPhone(VerifyPhoneParameter parameter);

  Future<AuthenticationModel> forgetPassword({
    required String phone,
  });

  Future<AuthenticationModel> resetPassword(ResetPasswordParameters resetPasswordParameters);
}

class AuthenticationRemoteDataSource extends BaseAuthenticationRemoteDataSource {
  final DioHelper dioHelper;
  AuthenticationRemoteDataSource(this.dioHelper);
  @override
  Future<AuthenticationModel> login(LoginParameter loginParameter) async {
    try{
      final response = await dioHelper.postData(
        url: EndPoints.login,
        data: {
          'phoneNumber': loginParameter.phone,
          'password': loginParameter.password,
        },
      );
      return AuthenticationModel.fromJson(response.data);
    }on DioError catch(error){
      throw AuthErrorException(AuthErrorModel.fromJson(error.response!.data));
    }

  }

  @override
  Future<AuthenticationModel> register(RegisterParameter registerParameter) async {
    try{
      final response = await dioHelper.postData(
        url: EndPoints.register,
        data: {
          'phoneNumber': registerParameter.phone,
          'password': registerParameter.password,
          "firstName": registerParameter.firstName,
          "lastName": registerParameter.lastName,
        },
      );
      return AuthenticationModel.fromJson(response.data);
    }on DioError catch(error){
      throw AuthErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<AuthenticationModel> verifyPhone(VerifyPhoneParameter parameter) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.verifyPhone,
        data: {
          'phoneNumber': parameter.phone,
          "code": parameter.code,
        },
      );
      return AuthenticationModel.fromJson(response.data);
    }on DioError catch(error){
      print(error.message);
      print(error.response!.data);
      throw AuthErrorException(AuthErrorModel.fromJson(error.response!.data));
    }

  }

  @override
  Future<AuthenticationModel> forgetPassword({required String phone}) async{
    try {
      final response = await dioHelper.postData(
        url: EndPoints.forgetPassword,
        data: {
          'phoneNumber': phone,
        },
      );
      return AuthenticationModel.fromJson(response.data);

    } on DioError catch(error){
      throw AuthErrorException(AuthErrorModel.fromJson(error.response!.data));
    }

  }

  @override
  Future<AuthenticationModel> resetPassword(ResetPasswordParameters resetPasswordParameters) async{
    try {
      final response = await dioHelper.postData(
        url: EndPoints.resetPassword,
        data: {
          "phoneNumber": resetPasswordParameters.phone,
          "password": resetPasswordParameters.password,
          "code": resetPasswordParameters.code
        },
      );
      return AuthenticationModel.fromJson(response.data);
    }on DioError catch(error){
      throw AuthErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }
}
