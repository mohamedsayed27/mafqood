
import 'package:mafqood/domain/entities/get_my_lost_peoples_entity.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../../domain/entities/lost_people_entity.dart';

abstract class LostPeopleState {}

class LostPeopleInitial extends LostPeopleState {}




class AddLostPersonDataLoading extends LostPeopleState {}
class AddLostPersonDataSuccess extends LostPeopleState {
  final LostPeopleEntity lostPeopleEntity;

  AddLostPersonDataSuccess({required this.lostPeopleEntity});
}
class AddLostPersonDataError extends LostPeopleState {
  final AuthErrorException authErrorException;
  AddLostPersonDataError({required this.authErrorException});
}



class SendLostPersonDataLoading extends LostPeopleState {}
class SendLostPersonDataSuccess extends LostPeopleState {
  final LostPeopleEntity lostPeopleEntity;

  SendLostPersonDataSuccess({required this.lostPeopleEntity});
}
class SendLostPersonDataError extends LostPeopleState {
  final AuthErrorException authErrorException;
  SendLostPersonDataError({required this.authErrorException});
}


class GetMyLostDataLoading extends LostPeopleState {}
class GetMyLostDataSuccess extends LostPeopleState {
  final GetMyLostPeopleEntity getMyLostPeopleEntity;

  GetMyLostDataSuccess({required this.getMyLostPeopleEntity});
}
class GetMyLostDataError extends LostPeopleState {
  final AuthErrorException authErrorException;
  GetMyLostDataError({required this.authErrorException});
}


class GetCitiesLoading extends LostPeopleState {}
class GetCitiesSuccess extends LostPeopleState {}
class GetCitiesError extends LostPeopleState {
  final AuthErrorException authErrorException;
  GetCitiesError({required this.authErrorException});
}


class GetAreasLoading extends LostPeopleState {}
class GetAreasSuccess extends LostPeopleState {}
class GetAreasError extends LostPeopleState {
  final AuthErrorException authErrorException;
  GetAreasError({required this.authErrorException});
}



class GetPickedImageSuccessState extends LostPeopleState {

}
class GetPickedImageErrorState extends LostPeopleState {}
class GetLostPersonPickedImageSuccessState extends LostPeopleState {}
class GetLostPersonPickedImageErrorState extends LostPeopleState {}
class GetDateTimePickedSuccessState extends LostPeopleState {
  final DateTime? dateTime;

  GetDateTimePickedSuccessState(this.dateTime);
}
class GetDateTimePickedErrorState extends LostPeopleState {}