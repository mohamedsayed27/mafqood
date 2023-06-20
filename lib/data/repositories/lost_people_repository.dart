import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mafqood/core/base_usecases/base_usecase.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/data/data_source/lost_people_remote_data_source.dart';
import 'package:mafqood/domain/entities/area_entity.dart';
import 'package:mafqood/domain/entities/basic_response_entity.dart';
import 'package:mafqood/domain/entities/city_entity.dart';
import 'package:mafqood/domain/entities/get_all_lost_entity.dart';
import 'package:mafqood/domain/entities/get_my_lost_peoples_entity.dart';
import 'package:mafqood/domain/entities/lost_people_entity.dart';
import 'package:mafqood/domain/entities/lost_person_data_entity.dart';
import 'package:mafqood/domain/entities/search_lost_by_name_entity.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/help_lost_person_usecase.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/update_my_lost_usecase.dart';

import '../data_source/lost_people_local_data_source.dart';

class LostPeopleRepository extends LostPeopleBaseRepository {
  final BaseLostPeopleRemoteDataSource baseLostPeopleRemoteDataSource;
  final BaseLostPeopleLocalDataSource baseLostPeopleLocalDataSource;

  LostPeopleRepository({required this.baseLostPeopleLocalDataSource,required this.baseLostPeopleRemoteDataSource});

  @override
  Future<Either<ErrorException, LostPeopleEntity>> sendLostPersonsDataFromFamily(AddLostPersonFromFamilyDataParameters addLostPersonDataParameters) async {
    try {
      final response = await baseLostPeopleRemoteDataSource
          .addLostPersonDataFromFamily(addLostPersonDataParameters);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          error.authErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, LostPeopleEntity>> addLostPersonsDataFromAnonymous(AddLostPersonsDataFromAnonymousParameters helpLostPersonDataParameters) async{
    try {
      final response = await baseLostPeopleRemoteDataSource.helpLostPerson(helpLostPersonDataParameters);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          error.authErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, BasicSuccessResponseEntity>> updateMyLost(UpdateMyLostParameters updateMyLostParameters) async{
    try {
      final response = await baseLostPeopleRemoteDataSource.updateMyLost(updateMyLostParameters);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          error.authErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetMyLostPeopleEntity>> getMyLostPeople() async{
    try {
      final response = await baseLostPeopleRemoteDataSource.getMyLostPeople(const NoParameters());
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          error.authErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, List<AreaEntity>>> getAreas(String id) async{
    try {
      final response = await baseLostPeopleLocalDataSource.getArea(id);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          error.authErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, List<CityEntity>>> getCities() async{
    try {
      final response = await baseLostPeopleLocalDataSource.getCities(const NoParameters());
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          error.authErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, LostPersonEntity>> searchLostPersonByItsImage(File image) async{
    try {
      final response = await baseLostPeopleRemoteDataSource.searchForLostPersonByImage(image);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          error.authErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, SearchLostPeopleEntity>> searchLostPeopleByName(String name) async{
    try {
      final response = await baseLostPeopleRemoteDataSource.searchForLostPersonByName(name);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          error.authErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetAllLostEntity>> getAllLost(int pageNumber) async{
    try {
      final response = await baseLostPeopleRemoteDataSource.getAllLost(pageNumber);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          error.authErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetAllLostEntity>> getAllSurvivals(int pageNumber) async{
    try {
      final response = await baseLostPeopleRemoteDataSource.getAllSurvivals(pageNumber);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          error.authErrorModel,
        ),
      );
    }
  }
}
