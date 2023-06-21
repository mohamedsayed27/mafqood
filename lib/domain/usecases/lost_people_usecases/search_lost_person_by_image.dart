import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mafqood/core/base_usecases/base_usecase.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';

import '../../entities/lost_person_data_entity.dart';
import '../../entities/main_response_entity.dart';
import '../../repository/lost_people_base_repository/lost_people_base_repository.dart';

class SearchForPersonByImageUsecase extends BaseUsecase<MainResponseEntity, File>{
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  SearchForPersonByImageUsecase({required this.lostPeopleBaseRepository});

  @override
  Future<Either<ErrorException, MainResponseEntity>> call(File parameters) async{
    return await lostPeopleBaseRepository.searchLostPersonByItsImage(parameters);
  }

}