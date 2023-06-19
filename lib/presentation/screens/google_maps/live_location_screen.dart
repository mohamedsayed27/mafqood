import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LiveLocationScreen extends StatefulWidget {
  const LiveLocationScreen({Key? key}) : super(key: key);

  @override
  State<LiveLocationScreen> createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends State<LiveLocationScreen> {
  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();
  static const LatLng destinationLocation = LatLng(37.33429383, -122.06600055);

  List<LatLng> polyLineCoordinates = [];

  void getPolyLinePoints() async {
    print("object");
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyCAOMyuhbP1CAJ1H4WnnMSXyC_xhpu72tE",
        PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));
    if (result.points.isNotEmpty) {
      result.points.forEach((element) {
        polyLineCoordinates.add(LatLng(element.latitude, element.longitude));
        print(element);
      });
    }
  }

  LocationData? currentLocation;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((value) {
      currentLocation = value;
    });
    GoogleMapController controller = await googleMapController.future;
    location.onLocationChanged.listen((event) {
      currentLocation = event;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        zoom: 13,
      )));
      getPolyLinePoints();
      setState(() {});
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Tracker"),
        centerTitle: true,
      ),
      body: currentLocation == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    currentLocation!.latitude!, currentLocation!.longitude!),
                zoom: 13,
              ),
              polylines: {
                Polyline(
                    polylineId: const PolylineId("route"),
                    points: polyLineCoordinates,
                    color: Colors.red,
                    width: 6)
              },
              markers: {
                Marker(
                  markerId: MarkerId("source"),
                  position: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                ),
                const Marker(
                  markerId: MarkerId("destination"),
                  position: destinationLocation,
                ),
              },
            ),
    );
  }
}
