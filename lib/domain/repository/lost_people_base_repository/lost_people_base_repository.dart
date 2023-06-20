import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mafqood/domain/entities/area_entity.dart';
import 'package:mafqood/domain/entities/basic_response_entity.dart';
import 'package:mafqood/domain/entities/city_entity.dart';
import 'package:mafqood/domain/entities/lost_people_entity.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/help_lost_person_usecase.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/update_my_lost_usecase.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../entities/get_all_lost_entity.dart';
import '../../entities/get_my_lost_peoples_entity.dart';
import '../../entities/lost_person_data_entity.dart';
import '../../entities/search_lost_by_name_entity.dart';

abstract class LostPeopleBaseRepository{
  Future<Either<ErrorException, LostPeopleEntity>> sendLostPersonsDataFromFamily(AddLostPersonFromFamilyDataParameters addLostPersonDataParameters);
  Future<Either<ErrorException, LostPeopleEntity>> addLostPersonsDataFromAnonymous(AddLostPersonsDataFromAnonymousParameters helpLostPersonDataParameters);
  Future<Either<ErrorException, BasicSuccessResponseEntity>> updateMyLost(UpdateMyLostParameters updateMyLostParameters);
  Future<Either<ErrorException, LostPersonEntity>> searchLostPersonByItsImage(File image);
  Future<Either<ErrorException, SearchLostPeopleEntity>> searchLostPeopleByName(String name);
  Future<Either<ErrorException, GetMyLostPeopleEntity>> getMyLostPeople();
  Future<Either<ErrorException, GetAllLostEntity>> getAllLost(int pageNumber);
  Future<Either<ErrorException, GetAllLostEntity>> getAllSurvivals(int pageNumber);
  Future<Either<ErrorException, List<CityEntity>>> getCities();
  Future<Either<ErrorException, List<AreaEntity>>> getAreas(String id);
}