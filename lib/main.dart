import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/cache_manager/shared_preferences.dart';
import 'package:mafqood/core/network/dio_helper.dart';
import 'package:mafqood/presentation/controllers/chat_cubit/chat_cubit.dart';
import 'package:mafqood/presentation/controllers/google_maps_cubit/google_maps_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/user_cubit/user_cubit.dart';
import 'package:mafqood/try_screen.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'bloc_observer.dart';
import 'core/theme/app_colors_light_theme.dart';
import 'core/notification/notification_services.dart';
import 'core/services/services_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/app_router/app_router.dart';
import 'core/app_router/screens_name.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.initializeNotificationService(
    onDidReceiveNotificationResponse,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  isNfcAvalible = await NfcManager.instance.isAvailable();

  runApp(const MyApp());
}

bool isNfcAvalible = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => UserCubit(
                sl(),
                sl(),
                sl(),
                sl(),
                sl(),
              ),
            ),
            BlocProvider(
              create: (context) => LostPeopleCubit(
                sl(),
                sl(),
                sl(),
                sl(),
                sl(),
                sl(),
                sl(),
                sl(),
                sl(),
              )..getCities(),
            ),
            BlocProvider(
              create: (context) => GoogleMapsCubit()..getCurrentPosition(),
            ),
            BlocProvider(
              create: (context) => ChatCubit(),
            ),
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
              primarySwatch: createMaterialColor(
                AppColors.primaryColor,
              ),
            ),
            // onGenerateRoute: AppRouter.generateRoute,
            // initialRoute: ScreenName.splashscreen,
            home:  TryScreen(title: 'Test NFC',),
          ),
        );
      },
    );
  }
}
