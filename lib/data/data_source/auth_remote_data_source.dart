import 'package:dio/dio.dart';
import 'package:mafqood/core/network/api_end_points.dart';
import 'package:mafqood/data/models/auth_model.dart';

import '../../core/error/auth_error_exception.dart';
import '../../core/network/dio_helper.dart';
import '../../core/network/error_message_model.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<AuthenticationModel> login({
    required String password,
    required String phone,
  });

  Future<AuthenticationModel> register({
    required String password,
    required String phone,
    required String firstName,
    required String lastName,
  });

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
  Future<AuthenticationModel> register({
    required String password,
    required String phone,
    required String firstName,
    required String lastName,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.register,
      data: {
        'phoneNumber': phone,
        'password': password,
        "firstName": firstName,
        "lastName": lastName,
      },
    );

    if (response.statusCode == 200) {
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw AuthErrorException(AuthErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<AuthenticationModel> verifyPhone({
    required String code,
    required String phone,
  }) async {
    final response = await DioHelper.postData(
      url: EndPoints.verifyPhone,
      data: {
        'phoneNumber': phone,
        "code": code,
      },
    );

    if (response.statusCode == 200) {
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw AuthErrorException(AuthErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<AuthenticationModel> forgetPassword({required String phone}) async{
    final response = await DioHelper.postData(
      url: EndPoints.forgetPassword,
      data: {
        'phoneNumber': phone,
      },
    );
    if (response.statusCode == 200) {
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw AuthErrorException(AuthErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<AuthenticationModel> resetPassword({required String phone, required String password, required String code}) async{
    final response = await DioHelper.postData(
      url: EndPoints.resetPassword,
      data: {
        "phoneNumber": phone,
        "password": password,
        "code": code
      },
    );
    if (response.statusCode == 200) {
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw AuthErrorException(AuthErrorModel.fromJson(response.data));
    }
  }
}
