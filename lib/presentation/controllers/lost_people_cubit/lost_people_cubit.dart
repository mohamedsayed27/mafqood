import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/get_my_lost_people_usecase.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../../domain/usecases/lost_people_usecases/get_areas_usecase.dart';
import '../../../domain/usecases/lost_people_usecases/get_cities_usecase.dart';
import '../../../domain/usecases/lost_people_usecases/help_lost_person_usecase.dart';
import 'lost_people_state.dart';

class LostPeopleCubit extends Cubit<LostPeopleState> {
  LostPeopleCubit(this._addLostPersonDataUsecase, this._sendLostPersonDataUsecase, this._getMyLostPeopleUsecase, this._getCitiesUsecase, this._getAreasUsecase) : super(LostPeopleInitial());
  static LostPeopleCubit get(context) => BlocProvider.of(context);
  DateTime? dateTime;
  final AddLostPersonDataUsecase _addLostPersonDataUsecase;
  final HelpLostPersonDataUsecase _sendLostPersonDataUsecase;
  final GetMyLostPeopleUsecase _getMyLostPeopleUsecase;
  final GetCitiesUsecase _getCitiesUsecase;
  final GetAreasUsecase _getAreasUsecase;
  File? imagePicked;
  File? lostPersonImage;
  final _picker = ImagePicker();

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

  Future<void> getImagePick(int source) async {
    final pickedFile = await _picker.pickImage(source: source == 1?ImageSource.gallery:ImageSource.camera);
    if (pickedFile != null) {
      imagePicked = File(pickedFile.path);
      emit(GetPickedImageSuccessState());
    } else {
      emit(GetPickedImageErrorState());
    }
  }

  Future<void> getLostPersonImagePicked(int source) async {
    final pickedFile = await _picker.pickImage(source: source == 1?ImageSource.gallery:ImageSource.camera);
    if (pickedFile != null) {
      lostPersonImage = File(pickedFile.path);
      emit(GetLostPersonPickedImageSuccessState());
    } else {
      emit(GetLostPersonPickedImageErrorState());
    }
  }

  void addLostPersonData(AddLostPersonDataParameters addLostPersonDataParameters) async {
    emit(AddLostPersonDataLoading());
    final response = await _addLostPersonDataUsecase(addLostPersonDataParameters);
    response.fold((l) {
      print(l);
      emit(AddLostPersonDataError(authErrorException: l));
    }, (r) {
      print(r);
      emit(AddLostPersonDataSuccess(lostPeopleEntity: r));
    });
  }

  void sendLostPersonData(HelpLostPersonDataParameters sendLostPersonDataParameter) async {
    emit(SendLostPersonDataLoading());
    final response = await _sendLostPersonDataUsecase(sendLostPersonDataParameter);
    response.fold((l) {
      print(l);
      emit(SendLostPersonDataError(authErrorException: l));
    }, (r) {
      print(r);
      emit(SendLostPersonDataSuccess(lostPeopleEntity: r));
    });
  }

  void getMyLostPeopleList() async {
    emit(GetMyLostDataLoading());
    final response = await _getMyLostPeopleUsecase(const NoParameters());
    response.fold((l) {
      print(l);
      emit(GetMyLostDataError(authErrorException: l));
    }, (r) {
      print(r);
      emit(GetMyLostDataSuccess(getMyLostPeopleEntity: r));
    });
  }

  void getCities() async {
    emit(GetCitiesLoading());
    final response = await _getCitiesUsecase(const NoParameters());
    response.fold((l) {
      print(l);
      emit(GetCitiesError(authErrorException: l));
    }, (r) {
      print(r);
      emit(GetCitiesSuccess());
    });
  }

  void getAreas(String id) async {
    emit(GetAreasLoading());
    final response = await _getAreasUsecase(id);
    response.fold((l) {
      print(l);
      emit(GetAreasError(authErrorException: l));
    }, (r) {
      print(r);
      emit(GetAreasSuccess());
    });
  }
}
