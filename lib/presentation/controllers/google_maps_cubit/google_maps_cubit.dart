import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
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

  Future<void> getCurrentPosition() async {
    currentPosition = await _googleMapsServices.getGeoLocationPosition();
    print(currentPosition);
    emit(GetCurrentPositionSuccess());
  }

  void getChosenPositionName({required double lat, required double lng}) async {
    emit(ChosenCurrentPositionNameLoading());
   try{
     List<Placemark> placeNameList = await _googleMapsServices.getUserAddress(lng: lng,lat: lat);
     chosenPositionName = placeNameList[0].street!;
     emit(ChosenCurrentPositionName(cityName: chosenPositionName, lng: lat, lat: lng));
   }catch(error){
     emit(ChosenCurrentPositionNameError());
   }
  }

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

  chooseLocation(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("قم بأختيار موقعك"),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('احتر الموقع من عالخريطه'),
              onPressed: () async {
                Navigator.of(context).pop();
                final latLng = await Navigator.pushNamed(
                    context, ScreenName.googleMapsScreen) as LatLng;
                getChosenPositionName(lat: latLng.latitude, lng: latLng.longitude);
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('موقعك الحالي'),
              onPressed: () async {
                Navigator.of(context).pop();
                getCurrentPosition().whenComplete(() {
                  getChosenPositionName(lat: currentPosition!.latitude, lng: currentPosition!.longitude);

                });
              },
            ),
          ],
        );
      },
    );
  }
}
