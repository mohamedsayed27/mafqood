import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/global/theme/app_colors_light_theme.dart';
import 'lost_people_state.dart';

class LostPeopleCubit extends Cubit<LostPeopleState> {
  LostPeopleCubit(this.addLostPersonDataUsecase) : super(LostPeopleInitial());
  static LostPeopleCubit get(context) => BlocProvider.of(context);
  DateTime? dateTime;
  selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("قم بأختيار صورة"),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('التقط صوره'),
              onPressed: () async {
                Navigator.of(context).pop();
                getImagePick(0);
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('قم بأختيار صورة'),
              onPressed: () async {
                Navigator.of(context).pop();
                getImagePick(1);
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('الغاء'),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  selectTDateTime(BuildContext context){
    showDatePicker(
      context: context,
      initialDate: dateTime ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData().copyWith(
            colorScheme: const ColorScheme.light(
                primary: AppColorsLightTheme.primaryColor,
                secondary: Colors.white),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    ).then((value) {
      dateTime = value;
      emit(GetDateTimePickedSuccessState(dateTime));
    }).catchError((error) {
      emit(GetDateTimePickedErrorState());
    });
  }
  File? imagePicked;
  File? lostPersonImage;
  var picker = ImagePicker();
  Future<void> getImagePick(int source) async {
    final pickedFile = await picker.pickImage(source: source == 1?ImageSource.gallery:ImageSource.camera);
    if (pickedFile != null) {
      imagePicked = File(pickedFile.path);
      emit(GetPickedImageSuccessState());
    } else {
      emit(GetPickedImageErrorState());
    }
  }
  Future<void> getLostPersonImagePicked(int source) async {
    final pickedFile = await picker.pickImage(source: source == 1?ImageSource.gallery:ImageSource.camera);
    if (pickedFile != null) {
      lostPersonImage = File(pickedFile.path);
      emit(GetLostPersonPickedImageSuccessState());
    } else {
      emit(GetLostPersonPickedImageErrorState());
    }
  }
  final AddLostPersonDataUsecase addLostPersonDataUsecase;
  void addLostPersonData(AddLostPersonDataParameters addLostPersonDataParameters) async {
    emit(AddLostPersonDataLoading());
    final response = await addLostPersonDataUsecase(addLostPersonDataParameters);
    response.fold((l) {
      print(l);
      emit(AddLostPersonDataError(authErrorException: l));
    }, (r) {
      print(r);
      emit(AddLostPersonDataSuccess(lostPeopleEntity: r));
    });
  }
}
