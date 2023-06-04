import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/core/network/api_end_points.dart';
import 'package:mafqood/core/network/dio_helper.dart';
import 'package:mafqood/core/network/error_message_model.dart';
import 'package:mafqood/data/data_source/auth_remote_data_source.dart';
import 'package:mafqood/data/models/auth_model.dart';
import 'package:mafqood/domain/entities/auth_entity.dart';
import 'package:mafqood/domain/usecases/auth_usecases/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthServices extends Mock implements DioHelper {}

void main() {
  group(
    "Test Authentication",
    () {
      final dioHelper = MockAuthServices();
      final authRemoteDataSource = AuthenticationRemoteDataSource(dioHelper);

      test(
        "Test User Login Sucess",
        () async {
          const loginParameter =
              LoginParameter(password: "Aa@123", phone: "01022542758");
          const authModel = AuthenticationModel(
              status: 200,
              message: 'scsac',
              data: Data(token: "sss", expireOn: "27/10/2013"),
              errors: null);
          when(
            () => dioHelper.postData(url: EndPoints.login, data: {
              'phoneNumber': loginParameter.phone,
              'password': loginParameter.password,
            }),
          ).thenAnswer((invocation) async => Response(
              requestOptions: RequestOptions(), data: authModel.toMap()));
          var response = await authRemoteDataSource.login(loginParameter);
          AuthenticationModel result = response;
          expect(result, const TypeMatcher<AuthenticationModel>());
        },
      );
      test(
        "Test User Login failure",
        () async {
          const loginParameter =
              LoginParameter(password: "xfxvbxzdvzdxv", phone: "cxvxcvxcv");
          const errorModel = AuthErrorModel(
              message: "message", status: 404, errors: ["errors"]);
          when(
            () => dioHelper.postData(url: EndPoints.login, data: {
              'phoneNumber': loginParameter.phone,
              'password': loginParameter.password,
            }),
          ).thenThrow(DioError(
              requestOptions: RequestOptions(),
              response: Response(
                  requestOptions: RequestOptions(), data: errorModel.toMap())));
          try {
            await authRemoteDataSource.login(loginParameter);
            fail('Expected ErrorException to be thrown');
          } on ErrorException catch (error) {
            expect(error, isInstanceOf<ErrorException>());
            expect((error).authErrorModel, isInstanceOf<AuthErrorModel>());
            expect((error).authErrorModel.errors, equals(['errors']));
          }
        },
      );
    },
  );
}
