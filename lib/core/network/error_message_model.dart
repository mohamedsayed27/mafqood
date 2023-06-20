import 'package:equatable/equatable.dart';

class AuthErrorModel extends Equatable {
  final String message;
  final int status;
  final List<String> errors;

  const AuthErrorModel(
      {required this.message, required this.status, required this.errors,});

  factory AuthErrorModel.fromJson(Map<String, dynamic> json) {
    return AuthErrorModel(
      message: json['message'],
      status: json['status'],
      errors: json['errors'].cast<String>(),
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "message":message,
      "status":status,
      "errors":errors,
    };
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
        message,
        status,
        errors,
      ];
}
