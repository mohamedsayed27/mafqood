import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafqood/presentation/controllers/google_maps_cubit/google_maps_cubit.dart';
import 'package:mafqood/presentation/controllers/google_maps_cubit/google_maps_state.dart';
import 'package:mafqood/presentation/screens/main_layout_screens/upload_data_screen.dart';

class GoogleMapsScreen extends StatelessWidget {
  const GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GoogleMapsCubit, GoogleMapsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = GoogleMapsCubit.get(context);
          return cubit.currentPosition == null
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        bearing: 0.0,
                        target: LatLng(cubit.currentPosition!.latitude,
                            cubit.currentPosition!.longitude),
                        tilt: 0.0,
                        zoom: 17,
                      ),
                      mapType: cubit.mapType,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      onTap: (value) {
                        print(value);
                        Navigator.pop(context,value);
                      },
                      onMapCreated: cubit.onMapCreated,
                    ),
                    Positioned(
                      top: 50.h,
                      left: 10.w,
                      child: PopupMenuButton(
                        color: Colors.white,
                        icon: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.more_vert_sharp,
                              size: 28.r,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              child: const Text(
                                'Normal',
                              ),
                              onTap: (){
                                cubit.changeMapType(type: 'n');
                              },
                            ),
                            PopupMenuItem(
                              child: const Text(
                                'Hybride',
                              ),
                              onTap: (){
                                cubit.changeMapType(type: 'h');
                              },
                            ),
                            PopupMenuItem(
                              child: const Text(
                                'Satalite',
                              ),
                              onTap: (){
                                cubit.changeMapType(type: 's');
                              },
                            ),
                          ];
                        },
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}
