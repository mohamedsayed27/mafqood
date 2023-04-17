import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafqood/presentation/controllers/google_maps_cubit/google_maps_cubit.dart';
import 'package:mafqood/presentation/controllers/google_maps_cubit/google_maps_state.dart';

import '../../../core/app_router/screens_name.dart';
import '../shred_widgets/simple_dialog_component.dart';

class ChooseLocationAlertDialog extends StatelessWidget {
  const ChooseLocationAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleMapsCubit, GoogleMapsState>(
      buildWhen: (p, c)=>false,
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GoogleMapsCubit.get(context);
        return SimpleDialog(
          title: const Text("قم بأختيار موقعك"),
          children: [
            SimpleDialogOptionWidget(
              title: 'احتر الموقع من عالخريطه',
              onPressed: () async {
                Navigator.of(context).pop();
                final latLng = await Navigator.pushNamed(
                    context, ScreenName.googleMapsScreen) as LatLng;
                cubit.latLng = LatLng(latLng.latitude, latLng.longitude);
                cubit.getChosenPositionName(
                    lat: latLng.latitude, lng: latLng.longitude);
              },
            ),
            SimpleDialogOptionWidget(
              title: 'موقعك الحالي',
              onPressed: () async {
                Navigator.of(context).pop();
                cubit.getCurrentPosition().then(
                      (v) {
                        cubit.latLng = LatLng(v.latitude, v.longitude);
                        cubit.getChosenPositionName(
                        lat: cubit.currentPosition!.latitude,
                        lng: cubit.currentPosition!.longitude);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
