import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../../core/error/auth_error_exception.dart';
import '../../entities/basic_response_entity.dart';
import '../../repository/lost_people_base_repository/lost_people_base_repository.dart';

class HelpLostPersonDataUsecase
    extends BaseUsecase<BasicSuccessResponseEntity, UpdateMyLostParameters> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  HelpLostPersonDataUsecase({required this.lostPeopleBaseRepository});

  @override
  Future<Either<AuthErrorException, BasicSuccessResponseEntity>> call(
      UpdateMyLostParameters parameters) async {
    return await lostPeopleBaseRepository.updateMyLost(parameters);
  }
}

class UpdateMyLostParameters extends Equatable {
  final int id;

  const UpdateMyLostParameters({
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
      ];
}
