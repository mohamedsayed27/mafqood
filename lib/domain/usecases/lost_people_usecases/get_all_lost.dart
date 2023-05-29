import 'package:dartz/dartz.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../entities/get_all_lost_entity.dart';

class GetAllLostUsecase extends BaseUsecase<GetAllLostEntity, int> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  GetAllLostUsecase({required this.lostPeopleBaseRepository});
  @override
  Future<Either<ErrorException, GetAllLostEntity>> call(int parameters) async{
    return await lostPeopleBaseRepository.getAllLost(parameters);
  }

}

