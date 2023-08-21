import 'package:equatable/equatable.dart';

import 'get_all_lost_entity.dart';
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
  final String? dateAdded;
  final bool? status;
  final UserEntity? user;


  const LostPersonDataEntity({
    this.id,
    this.name,
    this.birthDate,
    this.dateAdded,
    this.city,
    this.area,
    this.street,
    this.phoneNumber,
    this.long,
    this.lat,
    this.user,
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
    user,
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
      ];

}
