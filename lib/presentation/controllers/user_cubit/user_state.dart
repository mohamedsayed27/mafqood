
import 'package:mafqood/core/error/auth_error_exception.dart';
import 'package:mafqood/domain/entities/auth_entity.dart';

abstract class UserState {}

class UserInitial extends UserState {}


class LoginLoading extends UserState {}
class LoginSuccess extends UserState {
  final AuthenticationEntity authenticationEntity;

  LoginSuccess({required this.authenticationEntity});
}
class LoginError extends UserState {
  final AuthErrorException authErrorException;
  LoginError({required this.authErrorException});
}


class RegisterLoading extends UserState {}
class RegisterSuccess extends UserState {
  final AuthenticationEntity authenticationEntity;

  RegisterSuccess({required this.authenticationEntity});
}
class RegisterError extends UserState {
  final AuthErrorException authErrorException;
  RegisterError({required this.authErrorException});
}


class VerifyPhoneLoading extends UserState {}
class VerifyPhoneSuccess extends UserState {
  final AuthenticationEntity authenticationEntity;

  VerifyPhoneSuccess({required this.authenticationEntity});
}
class VerifyPhoneError extends UserState {
  final AuthErrorException authErrorException;
  VerifyPhoneError({required this.authErrorException});
}


class ResetPasswordLoading extends UserState {}
class ResetPasswordSuccess extends UserState {
  final AuthenticationEntity authenticationEntity;

  ResetPasswordSuccess({required this.authenticationEntity});
}
class ResetPasswordError extends UserState {
  final AuthErrorException authErrorException;
  ResetPasswordError({required this.authErrorException});
}


class ForgetPasswordLoading extends UserState {}
class ForgetPasswordSuccess extends UserState {
  final AuthenticationEntity authenticationEntity;

  ForgetPasswordSuccess({required this.authenticationEntity});
}
class ForgetPasswordError extends UserState {
  final AuthErrorException authErrorException;
  ForgetPasswordError({required this.authErrorException});
}
