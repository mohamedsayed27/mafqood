import 'package:equatable/equatable.dart';

class AreaEntity extends Equatable {
  final String id;
  final String areaAr;
  final String areaEn;
  final String cityId;

  const AreaEntity({
    required this.id,
    required this.areaAr,
    required this.areaEn,
    required this.cityId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        areaAr,
        areaEn,
        cityId,
      ];
}
