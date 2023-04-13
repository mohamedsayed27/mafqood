import 'package:dartz/dartz.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/data/data_source/lost_people_remote_data_source.dart';
import 'package:mafqood/domain/entities/lost_people_entity.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';

class LostPeopleRepository extends LostPeopleBaseRepository {
  final BaseLostPeopleRemoteDataSource baseLostPeopleRemoteDataSource;

  LostPeopleRepository({required this.baseLostPeopleRemoteDataSource});

  @override
  Future<Either<AuthErrorException, LostPeopleEntity>>
      searchLostPersonsByPhoto() {
    // TODO: implement searchLostPersonsByPhoto
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthErrorException, LostPeopleEntity>> sendLostPersonsData(
      AddLostPersonDataParameters addLostPersonDataParameters) async {
    try {
      final response = await baseLostPeopleRemoteDataSource
          .addLostPersonData(addLostPersonDataParameters);
      return Right(response);
    } on AuthErrorException catch (error) {
      return Left(
        AuthErrorException(
          error.authErrorModel,
        ),
      );
    }
  }
}
