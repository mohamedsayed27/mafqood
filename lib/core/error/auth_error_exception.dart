import '../network/error_message_model.dart';

class AuthErrorException implements Exception{
  final AuthErrorModel authErrorModel;

  AuthErrorException(this.authErrorModel);
}