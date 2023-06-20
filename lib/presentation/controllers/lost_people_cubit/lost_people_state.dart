import 'dart:io';

import 'package:mafqood/domain/entities/get_my_lost_peoples_entity.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../../domain/entities/get_all_lost_entity.dart';
import '../../../domain/entities/lost_people_entity.dart';
import '../../../domain/entities/lost_person_data_entity.dart';
import '../../../domain/entities/search_lost_by_name_entity.dart';

abstract class LostPeopleState {}

class LostPeopleInitial extends LostPeopleState {}

class AddLostPersonDataFromFamilyLoading extends LostPeopleState {}

class AddLostPersonDataFromFamilySuccess extends LostPeopleState {
  final LostPeopleEntity lostPeopleEntity;

  AddLostPersonDataFromFamilySuccess({required this.lostPeopleEntity});
}

class AddLostPersonDataFromFamilyError extends LostPeopleState {
  final ErrorException authErrorException;

  AddLostPersonDataFromFamilyError({required this.authErrorException});
}

class SendLostPersonDataLoading extends LostPeopleState {}

class SendLostPersonDataSuccess extends LostPeopleState {
  final LostPeopleEntity lostPeopleEntity;

  SendLostPersonDataSuccess({required this.lostPeopleEntity});
}

class SendLostPersonDataError extends LostPeopleState {
  final ErrorException authErrorException;

  SendLostPersonDataError({required this.authErrorException});
}

class GetAllLostLoading extends LostPeopleState {}

class GetAllLostSuccess extends LostPeopleState {
  final GetAllLostEntity getAllLostEntity;

  GetAllLostSuccess({required this.getAllLostEntity});
}

class GetAllLostError extends LostPeopleState {
  final ErrorException authErrorException;

  GetAllLostError({required this.authErrorException});
}

class GetAllSurvivalsDataLoading extends LostPeopleState {}
class GetMoreOfAllSurvivalsDataLoading extends LostPeopleState {}

class GetAllSurvivalsDataSuccess extends LostPeopleState {
  final GetAllLostEntity getAllLostEntity;

  GetAllSurvivalsDataSuccess({required this.getAllLostEntity});
}

class GetAllSurvivalsDataError extends LostPeopleState {
  final ErrorException authErrorException;

  GetAllSurvivalsDataError({required this.authErrorException});
}

class SearchForLostPersonByImageDataLoading extends LostPeopleState {}

class SearchForLostPersonByImageDataSuccess extends LostPeopleState {
  final LostPersonEntity lostPersonEntity;

  SearchForLostPersonByImageDataSuccess({required this.lostPersonEntity});
}

class SearchForLostPersonByImageDataError extends LostPeopleState {
  final ErrorException authErrorException;

  SearchForLostPersonByImageDataError({required this.authErrorException});
}

class SearchForLostPersonByNameDataLoading extends LostPeopleState {}

class SearchForLostPersonByNameDataSuccess extends LostPeopleState {
  final SearchLostPeopleEntity searchLostPeopleEntity;

  SearchForLostPersonByNameDataSuccess({required this.searchLostPeopleEntity});
}

class SearchForLostPersonByNameDataError extends LostPeopleState {
  final ErrorException authErrorException;

  SearchForLostPersonByNameDataError({required this.authErrorException});
}

class GetMyLostDataLoading extends LostPeopleState {}

class GetMyLostDataSuccess extends LostPeopleState {
  final GetMyLostPeopleEntity getMyLostPeopleEntity;

  GetMyLostDataSuccess({required this.getMyLostPeopleEntity});
}

class GetMyLostDataError extends LostPeopleState {
  final ErrorException authErrorException;

  GetMyLostDataError({required this.authErrorException});
}

class GetCitiesLoading extends LostPeopleState {}

class GetCitiesSuccess extends LostPeopleState {}

class GetCitiesError extends LostPeopleState {
  final ErrorException authErrorException;

  GetCitiesError({required this.authErrorException});
}

class GetAreasLoading extends LostPeopleState {}

class GetAreasSuccess extends LostPeopleState {}

class GetAreasError extends LostPeopleState {
  final ErrorException authErrorException;

  GetAreasError({required this.authErrorException});
}

class GetPickedImageSuccessState extends LostPeopleState {
  final File? image;

  GetPickedImageSuccessState({required this.image});
}

class GetPickedImageErrorState extends LostPeopleState {}

class GetLostPersonPickedImageSuccessState extends LostPeopleState {}

class GetLostPersonPickedImageErrorState extends LostPeopleState {}

class GetDateTimePickedSuccessState extends LostPeopleState {
  final DateTime? dateTime;

  GetDateTimePickedSuccessState(this.dateTime);
}

class GetDateTimePickedErrorState extends LostPeopleState {}

class ChangeAgeValueSuccess extends LostPeopleState {}

class ChangeAreaDropdownValueSuccess extends LostPeopleState {}

class ChangeCityDropdownValueSuccess extends LostPeopleState {
  final String cityId;

  ChangeCityDropdownValueSuccess({required this.cityId});
}
