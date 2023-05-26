import '../../domain/entities/lost_person_data_entity.dart';

class LostPersonModel extends LostPersonEntity {
  const LostPersonModel(
      {required super.status,
      required super.message,
      required super.data,
      required super.errors,});
factory LostPersonModel.fromJson(Map<String, dynamic> json) {
 return LostPersonModel( status : json['status'],
     message : json['message'],
     data : json['data'] != null ? new LostPersonDataModel.fromJson(json['data']) : null,
  errors : json['errors']!=null?json['errors'].cast<String>():null,);
}

}

class LostPersonDataModel extends LostPersonDataEntity {
  const LostPersonDataModel(
      {required super.id,
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
      required super.status});

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
    );
  }
}
