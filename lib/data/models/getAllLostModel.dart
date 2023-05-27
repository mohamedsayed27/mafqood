import '../../domain/entities/get_all_lost_entity.dart';

class GetAllLostModel extends GetAllLostEntity {
  const GetAllLostModel({
    required super.currentPage,
    required super.pageSize,
    required super.totalPages,
    required super.data,
  });

  factory GetAllLostModel.fromJson(Map<String, dynamic> json) {
    return GetAllLostModel(
      currentPage: json['currentPage'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
      data: json["data"].isNotEmpty
          ? List.from(json["data"])
              .map((e) => GetAllLostDataModel.fromJson(e))
              .toList()
          : null,
    );
  }
}

class GetAllLostDataModel extends GetAllLostDataEntity {
  const GetAllLostDataModel({
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
    required super.user,
  });

  factory GetAllLostDataModel.fromJson(Map<String, dynamic> json) {
    return GetAllLostDataModel(
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
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }
}

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.fullName,
    required super.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
