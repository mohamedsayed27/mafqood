import 'package:dartz/dartz.dart';
import 'package:mafqood/core/base_usecases/base_usecase.dart';
import 'package:mafqood/domain/entities/area_entity.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../entities/city_entity.dart';

abstract class LostPeopleBaseRepository{
  Future<Either<AuthErrorException, List<AreaEntity>>> getAreasList(NoParameters noParameters);
  Future<Either<AuthErrorException, List<CityEntity>>> getCitiesList(NoParameters noParameters);
}