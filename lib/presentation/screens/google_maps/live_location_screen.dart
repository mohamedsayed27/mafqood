import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafqood/core/assets_path/images_path.dart';

import '../../../core/services/google_maps_services.dart';

class LiveLocationScreen extends StatefulWidget {
  const LiveLocationScreen({Key? key}) : super(key: key);

  @override
  State<LiveLocationScreen> createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends State<LiveLocationScreen> {
  final Completer<GoogleMapController> _googleMapController =
      Completer<GoogleMapController>();
  final LatLng destinationLocation = const LatLng(30.008, 31.211);
  late final LatLng sourceLocation;

  final GoogleMapsServices googleMapsServices = GoogleMapsServices();
  List<LatLng> polyLineCoordinates = [];

  void getPolyLinePoints(Position? currentLocation) async {
    print("object");
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyCAOMyuhbP1CAJ1H4WnnMSXyC_xhpu72tE",
        PointLatLng(currentLocation!.latitude, currentLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));
    if (result.points.isNotEmpty) {
      for (var element in result.points) {
        polyLineCoordinates.add(LatLng(element.latitude, element.longitude));
        print(element);
      }
    }
    setState(() {});
  }

  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;
  Position? currentLocation;

  void getCurrentMarker() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, ImagesPath.splashLogo)
        .then((value) {
      currentIcon = value;
    });
    setState(() {});
  }

  void getCurrentLocation()async{
    googleMapsServices.getGeoLocationPosition().then((value) {
      currentLocation = value;
      sourceLocation =
          LatLng(currentLocation!.latitude, currentLocation!.longitude);
      print(currentLocation);
      getPolyLinePoints(currentLocation);
    });
    GoogleMapController controller = await _googleMapController.future;
    googleMapsServices
        .streamLocation(googleMapsServices.locationSettings)
        .then((value) {
      print(value);
      value.listen((event) {
        print(event.latitude);
        print(event.longitude);
        currentLocation = event;
        controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(currentLocation!.latitude, currentLocation!.longitude),zoom: zoomValue)));
        setState(() {});
      });
    });
  }

  double zoomValue = 13.5;
  @override
  void initState() {
    getCurrentMarker();
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Map Tracker",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: currentLocation == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : GoogleMap(
        onCameraMove: (CameraPosition cameraPosition){
          setState(() {
            zoomValue = cameraPosition.zoom;
          });
        },
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    currentLocation!.latitude, currentLocation!.longitude),
                zoom: zoomValue,
              ),
              polylines: {
                Polyline(
                    polylineId: const PolylineId("route"),
                    points: polyLineCoordinates,
                    color: Colors.red,
                    width: 6)
              },
              onMapCreated: (controller) {
                _googleMapController.complete(controller);
              },
              markers: {
                Marker(
                  markerId: const MarkerId("sourceLocation"),
                  position:
                      LatLng(sourceLocation.latitude, sourceLocation.longitude),
                ),
                Marker(
                  markerId: const MarkerId("currentLocation"),
                  icon: currentIcon,
                  position: LatLng(
                      currentLocation!.latitude, currentLocation!.longitude),
                ),
                Marker(
                  markerId: const MarkerId("destinationLocation"),
                  position: destinationLocation,
                ),
              },
            ),
    );
  }
}
