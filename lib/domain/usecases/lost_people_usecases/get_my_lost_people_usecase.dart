import 'package:dartz/dartz.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/entities/get_my_lost_peoples_entity.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../entities/main_response_entity.dart';
import '../../entities/search_by_name_entity.dart';

class GetMyLostPeopleUsecase extends BaseUsecase<SearchByNameEntity, NoParameters> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  GetMyLostPeopleUsecase({required this.lostPeopleBaseRepository});
  @override
  Future<Either<ErrorException, SearchByNameEntity>> call(NoParameters parameters) async{
    return await lostPeopleBaseRepository.getMyLostPeople();
  }
}

