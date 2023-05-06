import 'package:equatable/equatable.dart';

class GetMyLostPeopleEntity extends Equatable {
  final int status;
  final String message;
  final List<Data> data;
  final List<String> errors;

  const GetMyLostPeopleEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.errors});

  @override
  List<Object?> get props => [
        status,
        message,
        data,
        errors,
      ];
}

class Data extends Equatable {
  final int id;
  final String name;
  final String birthDate;
  final String city;
  final String area;
  final String street;
  final String phoneNumber;
  final int long;
  final int lat;
  final int longFind;
  final int latFind;
  final String url;
  final bool status;

  const Data({
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
  });

  @override
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
}
