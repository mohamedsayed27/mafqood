import 'package:dartz/dartz.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/entities/area_entity.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../repository/lost_people_base_repository/lost_people_base_repository.dart';

class GetAreasUsecase extends BaseUsecase<List<AreaEntity>, String> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  GetAreasUsecase({required this.lostPeopleBaseRepository});

  @override
  Future<Either<AuthErrorException, List<AreaEntity>>> call(String parameters) async{
    return await lostPeopleBaseRepository.getAreas(parameters);
  }
}

