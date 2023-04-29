import 'package:mafqood/domain/entities/basic_response_entity.dart';

class BasicSuccessResponseModel extends BasicSuccessResponseEntity {
  const BasicSuccessResponseModel({
    required super.status,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory BasicSuccessResponseModel.fromJson(Map<String, dynamic> json) {
    return BasicSuccessResponseModel(
      status: json["status"],
      message: json["message"],
      data: json["data"],
      errors: json["errors"],
    );
  }
}
