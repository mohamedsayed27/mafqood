import 'package:mafqood/domain/entities/get_my_lost_peoples_entity.dart';

class GetMyLostPeopleModel extends GetMyLostPeopleEntity {
  const GetMyLostPeopleModel({
    required super.status,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory GetMyLostPeopleModel.fromJson(Map<String, dynamic> json) {
    return GetMyLostPeopleModel(
      status: json["status"],
      message: json["message"],
      data: json["data"],
      errors: json["errors"],
    );
  }
}
