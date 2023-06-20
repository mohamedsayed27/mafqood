import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafqood/core/services/google_maps_services.dart';

import 'google_maps_state.dart';

class GoogleMapsCubit extends Cubit<GoogleMapsState> {
  GoogleMapsCubit() : super(GoogleMapsInitial());
  late Completer<GoogleMapController> mapController;
  MapType mapType = MapType.normal;
  String chosenPositionName = '';

  static GoogleMapsCubit get(context) => BlocProvider.of(context);
  Position? currentPosition;
  final GoogleMapsServices _googleMapsServices = GoogleMapsServices();

  Future<Position> getCurrentPosition() async {
    currentPosition = await _googleMapsServices.getGeoLocationPosition();
    emit(GetCurrentPositionSuccess());
    return currentPosition!;
  }

  void getChosenPositionName({required double lat, required double lng}) async {
    emit(ChosenCurrentPositionNameLoading());
    try {
      List<Placemark> placeNameList =
          await _googleMapsServices.getUserAddress(lng: lng, lat: lat);
      chosenPositionName = placeNameList[0].street!;
      emit(ChosenCurrentPositionName(
          cityName: chosenPositionName, lng: lat, lat: lng));
    } catch (error) {
      emit(ChosenCurrentPositionNameError());
    }
  }
  LatLng? latLng;

  void onMapCreated(GoogleMapController controller) {
    mapController = Completer();
    mapController.complete(controller);
  }

  void changeMapType({required String type}) {
    switch (type) {
      case 'n':
        mapType = MapType.normal;
        break;
      case 'h':
        mapType = MapType.hybrid;
        break;
      case 's':
        mapType = MapType.satellite;
        break;
    }
    emit(ChangeMapType());
  }

}
