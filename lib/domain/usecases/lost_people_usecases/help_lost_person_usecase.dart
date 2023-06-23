import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/repository/lost_people_base_repository/lost_people_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../entities/lost_people_entity.dart';
import '../../entities/main_response_entity.dart';

class AddLostPersonsDataFromAnonymousUsecase
    extends BaseUsecase<MainResponseEntity, AddLostPersonsDataFromAnonymousParameters> {
  final LostPeopleBaseRepository lostPeopleBaseRepository;

  AddLostPersonsDataFromAnonymousUsecase({required this.lostPeopleBaseRepository});

  @override
  Future<Either<ErrorException, MainResponseEntity>> call(
      AddLostPersonsDataFromAnonymousParameters parameters) async {
    return await lostPeopleBaseRepository.addLostPersonsDataFromAnonymous(parameters);
  }
}

class AddLostPersonsDataFromAnonymousParameters extends Equatable {
  final File image;
  final double lng;
  final double lat;
  final String name;
  final int maxEdge;
  final int minEdge;

  const AddLostPersonsDataFromAnonymousParameters({
    required this.image,
    required this.lng,
    required this.lat,
    required this.name,
    required this.maxEdge,
    required this.minEdge,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        image,
        lng,
        lat,
        name,
        maxEdge,
        minEdge,
      ];
}
