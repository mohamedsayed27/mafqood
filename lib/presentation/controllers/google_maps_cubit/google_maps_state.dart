
abstract class GoogleMapsState {}

class GoogleMapsInitial extends GoogleMapsState {}
class GetCurrentPositionSuccess extends GoogleMapsState {}
class ChangeMapType extends GoogleMapsState {}
class ChosenCurrentPositionNameLoading extends GoogleMapsState {}
class ChosenCurrentPositionName extends GoogleMapsState {
  final String cityName;
  final double lng;
  final double lat;

  ChosenCurrentPositionName( {required this.cityName,required this.lng, required this.lat,});
}
class ChosenCurrentPositionNameError extends GoogleMapsState {}

