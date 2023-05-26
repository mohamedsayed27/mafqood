import 'package:equatable/equatable.dart';

class LostPersonEntity extends Equatable {
  final int? status;
  final String? message;
  final LostPersonDataEntity? data;
  final List<String>? errors;

  const LostPersonEntity({
    this.status,
    this.message,
    this.data,
    this.errors,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        message,
        data,
        errors,
      ];

// LostPersonModel.fromJson(Map<String, dynamic> json) {
//   status = json['status'];
//   message = json['message'];
//   data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   errors = json['errors'].cast<String>();
// }
}

class LostPersonDataEntity extends Equatable {
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

  const LostPersonDataEntity({
    this.id,
    this.name,
    this.birthDate,
    this.city,
    this.area,
    this.street,
    this.phoneNumber,
    this.long,
    this.lat,
    this.longFind,
    this.latFind,
    this.url,
    this.status,
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
// }
}
