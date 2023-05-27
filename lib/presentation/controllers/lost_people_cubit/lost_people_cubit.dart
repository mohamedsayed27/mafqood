import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/domain/entities/area_entity.dart';
import 'package:mafqood/domain/entities/city_entity.dart';
import 'package:mafqood/domain/entities/lost_person_data_entity.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/get_my_lost_people_usecase.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../../domain/entities/search_lost_by_name_entity.dart';
import '../../../domain/usecases/lost_people_usecases/get_areas_usecase.dart';
import '../../../domain/usecases/lost_people_usecases/get_cities_usecase.dart';
import '../../../domain/usecases/lost_people_usecases/help_lost_person_usecase.dart';
import '../../../domain/usecases/lost_people_usecases/search_lost_people_by_name.dart';
import '../../../domain/usecases/lost_people_usecases/search_lost_person_by_image.dart';
import 'lost_people_state.dart';

class LostPeopleCubit extends Cubit<LostPeopleState> {
  LostPeopleCubit(
    this._addLostPersonDataUsecase,
    this._sendLostPersonDataUsecase,
    this._getMyLostPeopleUsecase,
    this._getCitiesUsecase,
    this._getAreasUsecase,
    this._searchForPersonByImageUsecase, this._searchLostPeopleByNameUsecase,
  ) : super(LostPeopleInitial());

  static LostPeopleCubit get(context) => BlocProvider.of(context);
  DateTime? dateTime;
  final AddLostPersonFromFamilyDataUsecase _addLostPersonDataUsecase;
  final AddLostPersonsDataFromAnonymousUsecase _sendLostPersonDataUsecase;
  final GetMyLostPeopleUsecase _getMyLostPeopleUsecase;
  final GetCitiesUsecase _getCitiesUsecase;
  final GetAreasUsecase _getAreasUsecase;
  final SearchForPersonByImageUsecase _searchForPersonByImageUsecase;
  final SearchLostPeopleByNameUsecase _searchLostPeopleByNameUsecase;
  File? lostPersonFromFamilyImage;
  File? lostPersonFromAnonymousImage;
  File? searchLostPersonImage;
  double? lat;
  double? lng;
  int? minAge;
  int? maxAge;
  final _picker = ImagePicker();
  List<CityEntity>? citiesList;
  List<AreaEntity>? areaList;
  CityEntity? cityEntity;
  AreaEntity? areaEntity;
  LostPersonDataEntity? lostPersonDataEntity;
  List<SearchByNameDataEntity>? searchForLostByNameLis;
  RangeValues values = const RangeValues(1, 100);

  bool searchByNameLoading = false;
  selectTDateTime(BuildContext context) {
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

  Future<void> getImagePick(int source, File? image) async {
    final pickedFile = await _picker.pickImage(
        source: source == 1 ? ImageSource.gallery : ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(GetPickedImageSuccessState(image: image));
    } else {
      emit(GetPickedImageErrorState());
    }
  }

  void addLostPersonDataFromFamily(
      AddLostPersonFromFamilyDataParameters addLostPersonDataParameters) async {
    emit(AddLostPersonDataFromFamilyLoading());
    final response =
        await _addLostPersonDataUsecase(addLostPersonDataParameters);
    response.fold((l) {
      emit(AddLostPersonDataFromFamilyError(authErrorException: l));
    }, (r) {
      emit(AddLostPersonDataFromFamilySuccess(lostPeopleEntity: r));
    });
  }

  void sendLostPersonData(
      AddLostPersonsDataFromAnonymousParameters
          sendLostPersonDataParameter) async {
    emit(SendLostPersonDataLoading());
    final response =
        await _sendLostPersonDataUsecase(sendLostPersonDataParameter);
    response.fold((l) {
      emit(SendLostPersonDataError(authErrorException: l));
    }, (r) {
      emit(SendLostPersonDataSuccess(lostPeopleEntity: r));
    });
  }

  void searchForLostPersonByImage() async {
    emit(SearchForLostPersonByImageDataLoading());
    final response =
        await _searchForPersonByImageUsecase(searchLostPersonImage!);
    response.fold((l) {
      emit(SearchForLostPersonByImageDataError(authErrorException: l));
    }, (r) {
      lostPersonDataEntity = r.data!;
      emit(SearchForLostPersonByImageDataSuccess(lostPersonEntity: r));
    });
  }

  void searchForLostPersonByName({required String name}) async {
    searchForLostByNameLis = [];
    searchByNameLoading = true;
    emit(SearchForLostPersonByNameDataLoading());
    final response = await _searchLostPeopleByNameUsecase(name);
    response.fold((l) {
      searchByNameLoading = false;
      emit(SearchForLostPersonByNameDataError(authErrorException: l));
    }, (r) {
      searchByNameLoading = false;
      searchForLostByNameLis = r.data;
      print(searchForLostByNameLis);
      emit(SearchForLostPersonByNameDataSuccess(searchLostPeopleEntity: r));
    });
  }

  void getMyLostPeopleList() async {
    emit(GetMyLostDataLoading());
    final response = await _getMyLostPeopleUsecase(const NoParameters());
    response.fold((l) {
      emit(GetMyLostDataError(authErrorException: l));
    }, (r) {
      emit(GetMyLostDataSuccess(getMyLostPeopleEntity: r));
    });
  }

  void getCities() async {
    emit(GetCitiesLoading());
    citiesList = [];
    final response = await _getCitiesUsecase(const NoParameters());
    response.fold((l) {
      emit(GetCitiesError(authErrorException: l));
    }, (r) {
      citiesList = r;
      emit(GetCitiesSuccess());
    });
  }

  void getAreas(String id) async {
    emit(GetAreasLoading());
    areaList = [];
    final response = await _getAreasUsecase(id);
    response.fold((l) {
      emit(GetAreasError(authErrorException: l));
    }, (r) {
      areaList = r;
      emit(GetAreasSuccess());
    });
  }

  void changeCityDropDownValue(CityEntity? cityEntity) async {
    this.cityEntity = cityEntity;
    areaEntity = null;
    emit(ChangeCityDropdownValueSuccess(cityId: this.cityEntity!.id!));
  }

  void changeAreaDropDownValue(AreaEntity? areaEntity) async {
    this.areaEntity = areaEntity;
    emit(ChangeAreaDropdownValueSuccess());
  }

  void changeAgeRangeValueValue(RangeValues rangeValues) async {
    values = rangeValues;
    emit(ChangeAgeValueSuccess());
  }
}
