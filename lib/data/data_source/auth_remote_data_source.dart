import 'package:dio/dio.dart';
import 'package:mafqood/core/network/api_end_points.dart';
import 'package:mafqood/data/models/auth_model.dart';
import 'package:mafqood/domain/usecases/auth_usecases/register_usecase.dart';

import '../../core/error/auth_error_exception.dart';
import '../../core/network/dio_helper.dart';
import '../../core/network/error_message_model.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<AuthenticationModel> login({
    required String password,
    required String phone,
  });

  Future<AuthenticationModel> register(RegisterParameter registerParameter);

  Future<AuthenticationModel> verifyPhone({
    required String code,
    required String phone,
  });

  Future<AuthenticationModel> forgetPassword({
    required String phone,
  });

  Future<AuthenticationModel> resetPassword({
    required String phone,
    required String password,
    required String code,
  });
}

class AuthenticationRemoteDataSource extends BaseAuthenticationRemoteDataSource {
  @override
  Future<AuthenticationModel> login({
    required String password,
    required String phone,
  }) async {
    try{
      final response = await DioHelper.postData(
        url: EndPoints.login,
        data: {
          'phoneNumber': phone,
          'password': password,
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
      final response = await DioHelper.postData(
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
  Future<AuthenticationModel> verifyPhone({
    required String code,
    required String phone,
  }) async {

    try {
      final response = await DioHelper.postData(
        url: EndPoints.verifyPhone,
        data: {
          'phoneNumber': phone,
          "code": code,
        },
      );
      return AuthenticationModel.fromJson(response.data);
    }on DioError catch(error){
      throw AuthErrorException(AuthErrorModel.fromJson(error.response!.data));
    }

  }

  @override
  Future<AuthenticationModel> forgetPassword({required String phone}) async{
    try {
      final response = await DioHelper.postData(
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
  Future<AuthenticationModel> resetPassword({required String phone, required String password, required String code}) async{
    try {
      final response = await DioHelper.postData(
        url: EndPoints.resetPassword,
        data: {
          "phoneNumber": phone,
          "password": password,
          "code": code
        },
      );
      return AuthenticationModel.fromJson(response.data);
    }on DioError catch(error){
      throw AuthErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }
}
