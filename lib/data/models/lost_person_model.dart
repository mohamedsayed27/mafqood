import '../../domain/entities/lost_person_data_entity.dart';

class LostPersonDataModel extends LostPersonDataEntity {
  const LostPersonDataModel({
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
    required super.dateAdded,
  });

  factory LostPersonDataModel.fromJson(Map<String, dynamic> json) {
    return LostPersonDataModel(
      id: json['id'],
      name: json['name'],
      birthDate: json['birthDate'],
      city: json['city'],
      area: json['area'],
      street: json['street'],
      phoneNumber: json['phoneNumber'],
      long: json['long'],
      lat: json['lat'],
      longFind: json['longFind'],
      latFind: json['latFind'],
      url: json['url'],
      status: json['status'],
      dateAdded: json['dateAdded'],
    );
  }
}
