import 'package:dartz/dartz.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../entities/get_all_lost_entity.dart';
import '../../entities/paginated_response_entity.dart';

class GetAllSurvivalsUsecase extends BaseUsecase<PaginatedLostPeopleResponseEntityEntity, int> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  GetAllSurvivalsUsecase({required this.lostPeopleBaseRepository});
  @override
  Future<Either<ErrorException, PaginatedLostPeopleResponseEntityEntity>> call(int parameters) async{
    return await lostPeopleBaseRepository.getAllSurvivals(parameters);
  }

}

