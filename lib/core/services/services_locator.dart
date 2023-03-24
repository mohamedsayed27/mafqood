import 'package:get_it/get_it.dart';
import 'package:mafqood/data/data_source/auth_remote_data_source.dart';
import 'package:mafqood/data/repositories/auth_repository.dart';
import 'package:mafqood/domain/usecases/register_usecase.dart';
import 'package:mafqood/domain/usecases/reset_password_usecase.dart';
import 'package:mafqood/domain/usecases/verify_phone.dart';

import '../../domain/repository/auth_base_repository.dart';
import '../../domain/usecases/forget_password_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../presentation/controllers/user_cubit/user_cubit.dart';

final sl = GetIt.instance;
class ServicesLocator{

  void init(){

    ///BLoC
    sl.registerFactory(() => UserCubit());

    ///USE CASES
    sl.registerLazySingleton(() => LoginUsecase(authenticationBaseRepository: sl()));
    sl.registerLazySingleton(() => RegisterUsecase(authenticationBaseRepository: sl()));
    sl.registerLazySingleton(() => ResetPasswordUsecase(authenticationBaseRepository: sl()));
    sl.registerLazySingleton(() => ForgetPasswordUsecase(authenticationBaseRepository: sl()));
    sl.registerLazySingleton(() => VerifyPhoneUsecase(authenticationBaseRepository: sl()));

    ///REPOSITORY
    sl.registerLazySingleton<AuthenticationBaseRepository>(() => AuthenticationRepository(baseAuthenticationRemoteDataSource: sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSource());
  }
}