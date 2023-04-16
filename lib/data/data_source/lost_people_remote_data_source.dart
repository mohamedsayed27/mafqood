
import 'package:dio/dio.dart';
import 'package:mafqood/data/models/lost_people_model.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';
import 'package:path/path.dart' as path;

import '../../core/error/auth_error_exception.dart';
import '../../core/network/api_end_points.dart';
import '../../core/network/dio_helper.dart';
import '../../core/network/error_message_model.dart';
import '../../domain/usecases/lost_people_usecases/help_lost_person.dart';

abstract class BaseLostPeopleRemoteDataSource {
 Future<LostPeopleModel> addLostPersonData(AddLostPersonDataParameters parameters);
 Future<LostPeopleModel> helpLostPerson(HelpLostPersonDataParameters parameters);
}

class LostPeopleRemoteDataSource extends BaseLostPeopleRemoteDataSource {
  @override
  Future<LostPeopleModel> addLostPersonData(AddLostPersonDataParameters parameters) async {
   try{
    final response = await DioHelper.postData(
     url: EndPoints.sendLostData,
     data: FormData.fromMap({
      'File': await MultipartFile.fromFile(parameters.image.path, filename: path.basename(parameters.image.path)),
      'Name': parameters.name,
      'BirthDate': parameters.birthDate,
      'City': parameters.city,
      'Area': parameters.area,
      'Street': parameters.street,
      'PhoneNumber': parameters.phone,
      'Long': parameters.lng,
      'Lat ': parameters.lat,
     }),
    );
    return LostPeopleModel.fromJson(response.data);
   }on DioError catch(error){
    print(error);
    throw AuthErrorException(AuthErrorModel.fromJson(error.response!.data));
   }

  }

  @override
  Future<LostPeopleModel> helpLostPerson(HelpLostPersonDataParameters parameters) async{
   try{
    final response = await DioHelper.postData(
     url: EndPoints.helpLostPerson,
     data: FormData.fromMap({
      'File': await MultipartFile.fromFile(parameters.image.path, filename: path.basename(parameters.image.path)),
      'Long': parameters.lng,
      'Lat ': parameters.lat,
     }),
    );
    return LostPeopleModel.fromJson(response.data);
   }on DioError catch(error){
    print(error);
    throw AuthErrorException(AuthErrorModel.fromJson(error.response!.data));
   }
  }
 }
