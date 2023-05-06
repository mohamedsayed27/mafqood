import 'package:mafqood/domain/entities/area_entity.dart';

class AreaModel extends AreaEntity {
  const AreaModel({
    required super.id,
    required super.areaAr,
    required super.areaEn,
    required super.cityId,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json["id"],
      areaAr: json["area_ar"],
      areaEn: json["area_en"],
      cityId: json["city_id"],
    );
  }
}
