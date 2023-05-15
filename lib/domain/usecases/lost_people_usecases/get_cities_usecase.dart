import 'package:dartz/dartz.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/entities/city_entity.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../repository/lost_people_base_repository/lost_people_base_repository.dart';

class GetCitiesUsecase extends BaseUsecase<List<CityEntity>, NoParameters> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  GetCitiesUsecase({required this.lostPeopleBaseRepository});

  @override
  Future<Either<AuthErrorException, List<CityEntity>>> call(NoParameters parameters) async{
    return await lostPeopleBaseRepository.getCities();
  }
}

