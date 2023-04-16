import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapsServices{

  GoogleMapsServices();

  Future<List<Placemark>> getUserAddress({required double lat, required double lng}) async {
    List<Placemark> placeMarks =
    await placemarkFromCoordinates(lat, lng);
    return placeMarks;
  }

   Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,);
  }
}