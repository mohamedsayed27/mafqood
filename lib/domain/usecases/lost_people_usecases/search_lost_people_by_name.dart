import 'package:dartz/dartz.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../entities/main_response_entity.dart';
import '../../entities/search_by_name_entity.dart';
import '../../entities/search_lost_by_name_entity.dart';

class SearchLostPeopleByNameUsecase extends BaseUsecase<SearchByNameEntity, String> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  SearchLostPeopleByNameUsecase({required this.lostPeopleBaseRepository});

  @override
  Future<Either<ErrorException, SearchByNameEntity>> call(String parameters) async{
    return await lostPeopleBaseRepository.searchLostPeopleByName(parameters);
  }
}

