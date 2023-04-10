import 'package:equatable/equatable.dart';

import '../network/error_message_model.dart';

class AuthErrorException extends Equatable implements Exception {
  final AuthErrorModel authErrorModel;

  const AuthErrorException(this.authErrorModel);

  @override
  // TODO: implement props
  List<Object?> get props => [
    authErrorModel,
  ];
}
class RegisterErrorException extends Equatable implements Exception {
  final String error;

  const RegisterErrorException(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [
    error,
  ];
}