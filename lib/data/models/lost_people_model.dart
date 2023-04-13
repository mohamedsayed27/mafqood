import 'package:mafqood/domain/entities/lost_people_entity.dart';

class LostPeopleModel extends LostPeopleEntity {
  const LostPeopleModel({
    required super.status,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory LostPeopleModel.fromJson(Map<String, dynamic> json) {
    return LostPeopleModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
      errors: json['errors'],
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
    required super.url,
    required super.publicId,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      birthDate: json['birthDate'],
      city: json['city'],
      area: json['area'],
      street: json['street'],
      phoneNumber: json['phoneNumber'],
      long: json['long'],
      lat: json['lat'],
      url: json['url'],
      publicId: json['publicId'],
    );
  }
}
