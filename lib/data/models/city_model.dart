import 'package:mafqood/domain/entities/area_entity.dart';

import '../../domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel({required super.id, required super.cityAr, required super.cityEn});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json["id"], cityAr: json['city_ar'], cityEn: json['city_en'],

    );
  }
}
