import 'package:dartz/dartz.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/entities/get_my_lost_peoples_entity.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';

class GetMyLostPeopleUsecase extends BaseUsecase<GetMyLostPeopleEntity, NoParameters> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  GetMyLostPeopleUsecase({required this.lostPeopleBaseRepository});
  @override
  Future<Either<ErrorException, GetMyLostPeopleEntity>> call(NoParameters parameters) async{
    return await lostPeopleBaseRepository.getMyLostPeople();
  }
}

