
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
