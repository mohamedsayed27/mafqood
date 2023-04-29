import 'package:dartz/dartz.dart';
import 'package:mafqood/domain/entities/basic_response_entity.dart';
import 'package:mafqood/domain/entities/lost_people_entity.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/help_lost_person.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/update_my_lost_usecase.dart';

import '../../../core/error/auth_error_exception.dart';

abstract class LostPeopleBaseRepository{
  Future<Either<AuthErrorException, LostPeopleEntity>> sendLostPersonsData(AddLostPersonDataParameters addLostPersonDataParameters);
  Future<Either<AuthErrorException, LostPeopleEntity>> helpLostPersonsByPhoto(HelpLostPersonDataParameters helpLostPersonDataParameters);
  Future<Either<AuthErrorException, BasicSuccessResponseEntity>> updateMyLost(UpdateMyLostParameters updateMyLostParameters);
}