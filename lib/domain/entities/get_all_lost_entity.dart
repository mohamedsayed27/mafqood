import 'package:equatable/equatable.dart';

class GetAllLostEntity extends Equatable {
  final int? currentPage;
  final int? pageSize;
  final int? totalPages;
  final List<GetAllLostDataEntity>? data;

  const GetAllLostEntity({
    required this.currentPage,
    required this.pageSize,
    required this.totalPages,
    required this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    currentPage,
    pageSize,
    totalPages,
    data,
  ];

// GetAllLostEntity.fromJson(Map<String, dynamic> json) {
//   currentPage = json['currentPage'];
//   pageSize = json['pageSize'];
//   totalPages = json['totalPages'];
//   if (json['data'] != null) {
//     data = <Data>[];
//     json['data'].forEach((v) {
//       data!.add(new Data.fromJson(v));
//     });
//   }
// }
}

class GetAllLostDataEntity extends Equatable {
  final int? id;
  final String? name;
  final String? birthDate;
  final String? city;
  final String? area;
  final String? street;
  final String? phoneNumber;
  final double? long;
  final double? lat;
  final double? longFind;
  final double? latFind;
  final String? url;
  final bool? status;
  final String? dateAdded;
  final UserEntity? user;

  const GetAllLostDataEntity({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.city,
    required this.area,
    required this.street,
    required this.phoneNumber,
    required this.long,
    required this.lat,
    required this.longFind,
    required this.latFind,
    required this.url,
    required this.status,
    required this.dateAdded,
    required this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
   id,
   name,
   birthDate,
   city,
   area,
   street,
   phoneNumber,
   long,
   lat,
   longFind,
   latFind,
   url,
   status,
   dateAdded,
   user,
  ];

// Data.fromJson(Map<String, dynamic> json) {
//   id = json['id'];
//   name = json['name'];
//   birthDate = json['birthDate'];
//   city = json['city'];
//   area = json['area'];
//   street = json['street'];
//   phoneNumber = json['phoneNumber'];
//   long = json['long'];
//   lat = json['lat'];
//   longFind = json['longFind'];
//   latFind = json['latFind'];
//   url = json['url'];
//   status = json['status'];
//   dateAdded = json['dateAdded'];
//   user = json['user'] != null ? new User.fromJson(json['user']) : null;
// }
}

class UserEntity extends Equatable {
  final String? id;
  final String? fullName;
  final String? phoneNumber;

  const UserEntity({required this.id, required this.fullName, required this.phoneNumber});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id, fullName, phoneNumber,
  ];

// User.fromJson(Map<String, dynamic> json) {
//   id = json['id'];
//   fullName = json['fullName'];
//   phoneNumber = json['phoneNumber'];
// }
}
