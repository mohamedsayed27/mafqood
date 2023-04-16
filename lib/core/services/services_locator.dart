import 'package:get_it/get_it.dart';
import 'package:mafqood/core/network/dio_helper.dart';
import 'package:mafqood/core/services/google_maps_services.dart';
import 'package:mafqood/data/data_source/auth_remote_data_source.dart';
import 'package:mafqood/data/repositories/auth_repository.dart';
import 'package:mafqood/domain/usecases/auth_usecases/register_usecase.dart';
import 'package:mafqood/domain/usecases/auth_usecases/reset_password_usecase.dart';
import 'package:mafqood/domain/usecases/auth_usecases/verify_phone.dart';
import 'package:mafqood/domain/usecases/lost_people_usecases/add_lost_person_usecase.dart';

import '../../data/data_source/lost_people_remote_data_source.dart';
import '../../data/repositories/lost_people_repository.dart';
import '../../domain/repository/auth_base_repository/auth_base_repository.dart';
import '../../domain/repository/lost_people_base_repository/lost_people_base_repository.dart';
import '../../domain/usecases/auth_usecases/forget_password_usecase.dart';
import '../../domain/usecases/auth_usecases/login_usecase.dart';
import '../../domain/usecases/lost_people_usecases/help_lost_person.dart';
import '../../presentation/controllers/google_maps_cubit/google_maps_cubit.dart';
import '../../presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import '../../presentation/controllers/user_cubit/user_cubit.dart';

final sl = GetIt.instance;
class ServicesLocator{

  void init(){

    ///---------------BLoC---------------

    sl.registerFactory(() => UserCubit(sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => LostPeopleCubit(sl()));
    sl.registerFactory(() => GoogleMapsCubit());


    ///---------------USE CASES---------------

    ///Auth USECASES ------------------->>>>>
    sl.registerLazySingleton(() => LoginUsecase(authenticationBaseRepository: sl()));
    sl.registerLazySingleton(() => RegisterUsecase(authenticationBaseRepository: sl()));
    sl.registerLazySingleton(() => ResetPasswordUsecase(authenticationBaseRepository: sl()));
    sl.registerLazySingleton(() => ForgetPasswordUsecase(authenticationBaseRepository: sl()));
    sl.registerLazySingleton(() => VerifyPhoneUsecase(authenticationBaseRepository: sl()));

    ///LOST PEOPLE USECASES ------------------->>>>>
    sl.registerLazySingleton(() => AddLostPersonDataUsecase(lostPeopleBaseRepository: sl()));
    sl.registerLazySingleton(() => HelpLostPersonDataUsecase(lostPeopleBaseRepository: sl()));


    ///---------------REPOSITORY---------------

    sl.registerLazySingleton<AuthenticationBaseRepository>(() => AuthenticationRepository(baseAuthenticationRemoteDataSource: sl()));
    sl.registerLazySingleton<LostPeopleBaseRepository>(() => LostPeopleRepository(baseLostPeopleRemoteDataSource: sl()));


    ///---------------DATA SOURCE---------------

    sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSource());
    sl.registerLazySingleton<BaseLostPeopleRemoteDataSource>(() => LostPeopleRemoteDataSource());


    ///---------------DioClass---------------

    sl.registerLazySingleton(() => DioHelper());

    ///---------------Google Maps Services---------------
    ///
    sl.registerLazySingleton(() => GoogleMapsServices());
  }
}