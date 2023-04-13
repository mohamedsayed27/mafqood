
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
class GetPickedImageSuccessState extends LostPeopleState {

}
class GetPickedImageErrorState extends LostPeopleState {}
class GetDateTimePickedSuccessState extends LostPeopleState {
  final DateTime? dateTime;

  GetDateTimePickedSuccessState(this.dateTime);
}
class GetDateTimePickedErrorState extends LostPeopleState {}