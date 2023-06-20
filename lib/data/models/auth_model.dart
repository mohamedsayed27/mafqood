import 'package:mafqood/domain/entities/auth_entity.dart';

class AuthenticationModel extends AuthenticationEntity {
  const AuthenticationModel({
    required super.status,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
      errors: json['errors']?.cast<String>(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "status": status,
      "message": message,
      "data": DataModel(token: data!.token, expireOn: data!.expireOn).toMap(),
      "errors": errors,
    };
  }
}

class DataModel extends Data {
  const DataModel({
    required super.token,
    required super.expireOn,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      token: json['token'],
      expireOn: json['expireOn'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "token": token,
      "expireOn": expireOn,
    };
  }
}
