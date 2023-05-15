import 'package:equatable/equatable.dart';

class LostPeopleEntity extends Equatable {
  final int? status;
  final String? message;
  final Data? data;
  final List<String>? errors;

  const LostPeopleEntity({this.status, this.message, this.data, this.errors});

  @override
  List<Object?> get props => [
        status,
        message,
        data,
        errors,
      ];
}

class Data extends Equatable {
  final int? id;
  final String? name;
  final String? birthDate;
  final String? city;
  final String? area;
  final String? street;
  final String? phoneNumber;
  final double? long;
  final double? lat;
  final String? url;
  final String? publicId;
  final int? longFind;
  final int? latFind;

  const Data(
      {this.id,
      this.name,
      this.birthDate,
      this.city,
      this.area,
      this.street,
      this.phoneNumber,
      this.long,
      this.lat,
        this.longFind, this.latFind,
        this.url,
      this.publicId});

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
        url,
        publicId,
    longFind, latFind,
  ];
}
