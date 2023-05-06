import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../entities/lost_people_entity.dart';

class HelpLostPersonDataUsecase extends BaseUsecase<LostPeopleEntity, HelpLostPersonDataParameters> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  HelpLostPersonDataUsecase({required this.lostPeopleBaseRepository});
  @override
  Future<Either<AuthErrorException, LostPeopleEntity>> call(HelpLostPersonDataParameters parameters) async{
    return await lostPeopleBaseRepository.helpLostPersonsByPhoto(parameters);
  }
}

class HelpLostPersonDataParameters extends Equatable {
  final File image;
  final double lng;
  final double lat;

  const HelpLostPersonDataParameters( {
    required this.image,
    required this.lng,
    required this.lat,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    image,
    lng,
    lat,
  ];
}
