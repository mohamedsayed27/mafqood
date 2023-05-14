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
      data: json["data"].length==0?null:List<DataModel>.from(json["data"].map((element) => DataModel.fromJson(element))),
      errors: json["errors"],
    );
  }
}

class DataModel extends Data {
  const DataModel({
    required super.id,
    required super.name,
    required super.birthDate,
    required super.city,
    required super.area,
    required super.street,
    required super.phoneNumber,
    required super.long,
    required super.lat,
    required super.longFind,
    required super.latFind,
    required super.url,
    required super.status,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["id"],
      name: json["name"],
      birthDate: json["birthDate"],
      city: json["city"],
      area: json["area"],
      street: json["street"],
      phoneNumber: json["phoneNumber"],
      long: json["long"],
      lat: json["lat"],
      longFind: json["longFind"],
      latFind: json["latFind"],
      url: json["url"],
      status: json["status"],
    );
  }
}
