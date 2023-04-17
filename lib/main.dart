import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/app_router/app_router.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/core/cache_manager/shared_preferences.dart';
import 'package:mafqood/core/network/dio_helper.dart';
import 'package:mafqood/presentation/controllers/google_maps_cubit/google_maps_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/user_cubit/user_cubit.dart';
import 'package:mafqood/presentation/screens/auth_screens/otp_verification_number_screen.dart';
import 'bloc_observer.dart';
import 'core/global/theme/app_colors_light_theme.dart';
import 'core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => UserCubit(sl(),sl(),sl(),sl(),sl())),
              BlocProvider(create: (context) => LostPeopleCubit(sl())),
              BlocProvider(create: (context) => GoogleMapsCubit()..getCurrentPosition()),
            ],
            child: MaterialApp(
              title: 'مفقود',
              localizationsDelegates: const [
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale("ar", "AE"),
              ],
              theme: ThemeData(
                primarySwatch:
                    createMaterialColor(AppColorsLightTheme.primaryColor),
              ),
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: ScreenName.splashscreen,
              // home:  OtpVerificationNumberScreen(phone: '01124276092',),
            ));
      },
    );
  }
}
