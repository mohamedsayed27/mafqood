import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mafqood/core/base_usecases/base_usecase.dart';
import 'package:mafqood/core/constants/constants.dart';
import 'package:mafqood/data/models/basic_response_model.dart';
import 'package:mafqood/data/models/lost_people_model.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';
import 'package:path/path.dart' as path;

import '../../core/error/auth_error_exception.dart';
import '../../core/network/api_end_points.dart';
import '../../core/network/dio_helper.dart';
import '../../core/network/error_message_model.dart';
import '../../domain/usecases/lost_people_usecases/help_lost_person_usecase.dart';
import '../../domain/usecases/lost_people_usecases/update_my_lost_usecase.dart';
import '../models/get_all_lost_model.dart';
import '../models/get_my_lost_people_model.dart';
import '../models/lost_person_model.dart';
import '../models/main_response_model.dart';
import '../models/paginated_response_model.dart';
import '../models/search_by_name_model.dart';
import '../models/search_lost_people_by_name.dart';

abstract class BaseLostPeopleRemoteDataSource {
  Future<MainResponseModel> addLostPersonDataFromFamily(
      AddLostPersonFromFamilyDataParameters parameters);

  Future<MainResponseModel> helpLostPerson(
      AddLostPersonsDataFromAnonymousParameters parameters);

  Future<BasicSuccessResponseModel> updateMyLost(
      UpdateMyLostParameters parameters);

  Future<SearchByNameModel> getMyLostPeople(NoParameters parameters);

  Future<MainResponseModel> searchForLostPersonByImage(File image);

  Future<SearchByNameModel> searchForLostPersonByName(String name);

  Future<PaginatedResponsePeopleModel> getAllLost(int pageNumber);

  Future<PaginatedResponsePeopleModel> getAllSurvivals(int pageNumber);
}

class LostPeopleRemoteDataSource extends BaseLostPeopleRemoteDataSource {
  final DioHelper dioHelper;

  LostPeopleRemoteDataSource(this.dioHelper);

  @override
  Future<MainResponseModel> addLostPersonDataFromFamily(
      AddLostPersonFromFamilyDataParameters parameters) async {
    try {
      final response = await dioHelper.postData(
        token: token,
        url: EndPoints.sendLostPersonDataFromFamily,
        data: FormData.fromMap({
          'File': await MultipartFile.fromFile(parameters.image.path,
              filename: path.basename(parameters.image.path)),
          'Name': parameters.name,
          'BirthDate': parameters.birthDate,
          'City': parameters.city,
          'Area': parameters.area,
          'Street': parameters.street,
          'PhoneNumber': parameters.phone,
          'Long': parameters.lng,
          'Lat': parameters.lat,
        }),
      );
      return MainResponseModel.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<MainResponseModel> helpLostPerson(
      AddLostPersonsDataFromAnonymousParameters parameters) async {
    try {
      final response = await dioHelper.postData(
        token: token,
        url: EndPoints.helpLostPerson,
        data: FormData.fromMap({
          'File': await MultipartFile.fromFile(parameters.image.path,
              filename: path.basename(parameters.image.path)),
          'Long': parameters.lng,
          'Lat': parameters.lat,
          'Name': parameters.name,
          'MaxAge': parameters.maxEdge,
          'MinAge': parameters.minEdge,
        }),
      );
      return MainResponseModel.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<BasicSuccessResponseModel> updateMyLost(
      UpdateMyLostParameters parameters) async {
    try {
      final response = await dioHelper.putData(
        token: token,
        url: EndPoints.updateMyLost,
        data: FormData.fromMap({
          'id': parameters.id,
        }),
      );
      return BasicSuccessResponseModel.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<SearchByNameModel> getMyLostPeople(NoParameters parameters) async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.getMyLostPeople,
        bearerToken: token,
      );
      print(response);
      return SearchByNameModel.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<MainResponseModel> searchForLostPersonByImage(File image) async {
    try {
      final response = await dioHelper.postData(
        token: token,
        url: EndPoints.findByPhoto,
        data: FormData.fromMap({
          'File': await MultipartFile.fromFile(
            image.path,
            filename: path.basename(image.path),
          ),
        }),
      );
      return MainResponseModel.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<SearchByNameModel> searchForLostPersonByName(String name) async {
    try {
      final response = await dioHelper.getData(
        bearerToken: token,
        url: EndPoints.findByName,
        query: {
          "Trim": name,
        },
      );
      return SearchByNameModel.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<PaginatedResponsePeopleModel> getAllLost(int pageNumber) async {
    try {
      final response = await dioHelper
          .getData(bearerToken: token, url: EndPoints.getAllLost, query: {
        "Page": pageNumber,
        "PageSize": 10,
      });
      return PaginatedResponsePeopleModel.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<PaginatedResponsePeopleModel> getAllSurvivals(int pageNumber) async {
    try {
      final response = await dioHelper
          .getData(bearerToken: token, url: EndPoints.getAllSurvivals, query: {
        "Page": pageNumber,
        "PageSize": 10,
      });
      return PaginatedResponsePeopleModel.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorException(AuthErrorModel.fromJson(error.response!.data));
    }
  }
}
