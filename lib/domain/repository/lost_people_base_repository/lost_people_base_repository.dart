import 'package:dartz/dartz.dart';
import 'package:mafqood/domain/entities/lost_people_entity.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';

import '../../../core/error/auth_error_exception.dart';

abstract class LostPeopleBaseRepository{
  Future<Either<AuthErrorException, LostPeopleEntity>> sendLostPersonsData(AddLostPersonDataParameters addLostPersonDataParameters);
  Future<Either<AuthErrorException, LostPeopleEntity>> searchLostPersonsByPhoto();
}