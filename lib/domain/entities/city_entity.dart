import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String? id;
  final String? cityAr;
  final String? cityEn;

  const CityEntity(
      {required this.id, required this.cityAr, required this.cityEn});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        cityAr,
        cityEn,
      ];
}
