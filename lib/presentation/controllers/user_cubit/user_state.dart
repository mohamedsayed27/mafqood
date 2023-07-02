
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/entities/auth_entity.dart';

import '../../../data/models/user_data_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}


class LoginLoading extends UserState {}
class LoginSuccess extends UserState {
  final AuthenticationEntity authenticationEntity;

  LoginSuccess({required this.authenticationEntity});
}
class LoginError extends UserState {
  final ErrorException authErrorException;
  LoginError({required this.authErrorException});
}


class RegisterLoading extends UserState {}
class RegisterSuccess extends UserState {
  final AuthenticationEntity authenticationEntity;

  RegisterSuccess({required this.authenticationEntity});
}
class RegisterError extends UserState {
  final ErrorException authErrorException;
  RegisterError({required this.authErrorException});
}


class VerifyPhoneLoading extends UserState {}
class VerifyPhoneSuccess extends UserState {
  final AuthenticationEntity authenticationEntity;

  VerifyPhoneSuccess({required this.authenticationEntity});
}
class VerifyPhoneError extends UserState {
  final ErrorException authErrorException;
  VerifyPhoneError({required this.authErrorException});
}


class ResetPasswordLoading extends UserState {}
class ResetPasswordSuccess extends UserState {
  final AuthenticationEntity authenticationEntity;

  ResetPasswordSuccess({required this.authenticationEntity});
}
class ResetPasswordError extends UserState {
  final ErrorException authErrorException;
  ResetPasswordError({required this.authErrorException});
}


class ForgetPasswordLoading extends UserState {}
class ForgetPasswordSuccess extends UserState {
  final AuthenticationEntity authenticationEntity;

  ForgetPasswordSuccess({required this.authenticationEntity});
}
class ForgetPasswordError extends UserState {
  final ErrorException authErrorException;
  ForgetPasswordError({required this.authErrorException});
}


class GetUserDataLoading extends UserState {}
class GetUserDataSuccess extends UserState {
  final UserDataModel userDataModel;

  GetUserDataSuccess({required this.userDataModel});
}
class GetUserDataError extends UserState {
  final String error;

  GetUserDataError({required this.error});
}
