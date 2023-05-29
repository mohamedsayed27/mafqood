import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../entities/lost_people_entity.dart';

class AddLostPersonFromFamilyDataUsecase extends BaseUsecase<LostPeopleEntity, AddLostPersonFromFamilyDataParameters> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  AddLostPersonFromFamilyDataUsecase({required this.lostPeopleBaseRepository});
  @override
  Future<Either<ErrorException, LostPeopleEntity>> call(AddLostPersonFromFamilyDataParameters parameters) async{
    return await lostPeopleBaseRepository.sendLostPersonsDataFromFamily(parameters);
  }
}

class AddLostPersonFromFamilyDataParameters extends Equatable {
  final String name;
  final String street;
  final String area;
  final String city;
  final String phone;
  final File image;
  final double lng;
  final double lat;
  final String birthDate;

  const AddLostPersonFromFamilyDataParameters( {
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
