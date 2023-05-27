import '../../domain/entities/search_lost_by_name_entity.dart';

class SearchLostPeopleByNameModel extends SearchLostPeopleEntity {
  const SearchLostPeopleByNameModel({
    required super.status,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory SearchLostPeopleByNameModel.fromJson(Map<String, dynamic> json) {
    return SearchLostPeopleByNameModel(
      status: json['status'],
      message: json['message'],
      errors: json['errors']?.cast<String>(),
      data: json['data'].isNotEmpty
          ? List.from(json['data']).map((e) => Data.fromJson(e)).toList()
          : null,
    );
  }
}

class Data extends SearchByNameDataEntity {
  const Data({
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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
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
    );
  }
}
