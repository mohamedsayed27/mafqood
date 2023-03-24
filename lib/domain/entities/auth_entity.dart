import 'package:equatable/equatable.dart';

class AuthenticationEntity extends Equatable {
  final int? status;
  final String? message;
  final Data? data;
  final List<String>? errors;

  const AuthenticationEntity({
    this.status,
    this.message,
    this.data,
    this.errors,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        data,
        errors,
      ];
}

class Data extends Equatable {
  final String? token;
  final String? expireOn;

  const Data({
    this.token,
    this.expireOn,
  });

  @override
  List<Object?> get props => [
        token,
        expireOn,
      ];
}
