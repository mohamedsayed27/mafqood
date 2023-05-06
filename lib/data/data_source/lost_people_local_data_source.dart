import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mafqood/core/base_usecases/base_usecase.dart';
import 'package:mafqood/data/models/city_model.dart';

import '../../core/error/auth_error_exception.dart';
import '../../core/global/assets_path/json_path.dart';
import '../../core/network/error_message_model.dart';
import '../models/area_model.dart';

abstract class BaseLostPeopleLocalDataSource {
  Future<List<AreaModel>> getArea(String id);
  Future<List<CityModel>> getCities(NoParameters parameters);
}
class LostPeopleLocalDataSource extends BaseLostPeopleLocalDataSource {
  @override
  Future<List<AreaModel>> getArea(String id) async{
    try {
      List<AreaModel> cities = [];
      String area = await rootBundle.loadString(AssetJsonPath.areaJson);
      cities = jsonDecode(area).where((element) => element['city_id'] == id).map((element) => AreaModel.fromJson(element)).toList();
      return cities;
    } catch (error) {
      throw AuthErrorException(
        AuthErrorModel.fromJson(
          {
            "message": "error occurred",
            "status": 400,
            "errors": [(error.toString())],
          },
        ),
      );
    }
  }

  @override
  Future<List<CityModel>> getCities(NoParameters parameters) async{
    try {
      List<CityModel> cities = [];
      String area = await rootBundle.loadString(AssetJsonPath.cityJson);
      cities = jsonDecode(area).map((element) => CityModel.fromJson(element)).toList();
      print(jsonDecode(area));
      return cities;
    } catch (error) {
      String area = await rootBundle.loadString(AssetJsonPath.cityJson);
      print(jsonDecode(area));
      print("//.....................Error.....................//");
      throw AuthErrorException(
        AuthErrorModel.fromJson(
          {
            "message": "error occurred",
            "status": 400,
            "errors": [(error.toString())],
          },
        ),
      );
    }
  }
}