import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../entities/lost_people_entity.dart';

class AddLostPersonDataUsecase extends BaseUsecase<LostPeopleEntity, AddLostPersonDataParameters> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  AddLostPersonDataUsecase({required this.lostPeopleBaseRepository});
  @override
  Future<Either<AuthErrorException, LostPeopleEntity>> call(AddLostPersonDataParameters parameters) async{
    return await lostPeopleBaseRepository.sendLostPersonsData(parameters);
  }
}

class AddLostPersonDataParameters extends Equatable {
  final String name;
  final String street;
  final String area;
  final String city;
  final String phone;
  final File image;
  final double lng;
  final double lat;
  final String birthDate;

  const AddLostPersonDataParameters( {
    required this.name,
    required this.street,
    required this.area,
    required this.city,
    required this.birthDate,
    required this.phone,
    required this.image,
    required this.lng,
    required this.lat,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        street,
        area,
        city,
        phone,
        image,
        lng,
        lat,
    birthDate,
      ];
}
