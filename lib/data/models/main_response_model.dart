import '../../domain/entities/lost_person_data_entity.dart';
import '../../domain/entities/main_response_entity.dart';
import 'lost_person_model.dart';

class MainResponseModel extends MainResponseEntity {
  const MainResponseModel({
    required super.status,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory MainResponseModel.fromJson(Map<String, dynamic> json) {
    return MainResponseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? LostPersonDataModel.fromJson(json['data'])
          : null,
      errors: json['errors'] != null ? json['errors'].cast<String>() : null,
    );
  }
}