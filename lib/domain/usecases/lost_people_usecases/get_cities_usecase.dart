import 'package:dartz/dartz.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/entities/city_entity.dart';

import '../../../core/base_usecases/base_usecase.dart';

class GetCitiesUsecase extends BaseUsecase<List<CityEntity>, NoParameters> {
  @override
  Future<Either<AuthErrorException, List<CityEntity>>> call(NoParameters parameters) {
    // TODO: implement call
    throw UnimplementedError();
  }

}

