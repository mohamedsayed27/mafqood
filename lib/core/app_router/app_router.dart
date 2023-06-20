import 'package:flutter/material.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/presentation/screens/auth_screens/login_screen.dart';
import 'package:mafqood/presentation/screens/auth_screens/register_screen.dart';
import 'package:mafqood/presentation/screens/main_layout_screens/main_layout.dart';

import '../../presentation/screens/auth_screens/change_forget_password.dart';
import '../../presentation/screens/auth_screens/forget_password_screen.dart';
import '../../presentation/screens/auth_screens/otp_verification_number_screen.dart';
import '../../presentation/screens/chat_screens/chat_screen.dart';
import '../../presentation/screens/intro_screens/onboarding_screen.dart';
import '../../presentation/screens/intro_screens/splash_screen.dart';
import '../../presentation/screens/google_maps/google_mas_screen.dart';
import '../../presentation/screens/main_layout_screens/all_survivals_screen.dart';



class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.splashscreen:
          return MaterialPageRoute(builder: (BuildContext context) { return const SplashScreen(); });
        case ScreenName.onboardingScreen:
          return MaterialPageRoute(builder: (BuildContext context) { return const OnboardingScreen(); });
        case ScreenName.loginScreen:
          return MaterialPageRoute(builder: (BuildContext context) { return const LoginScreen(); });
        case ScreenName.registerScreen:
          return _animateRouteBuilder(const RegisterScreen());
        case ScreenName.googleMapsScreen:
          return _animateRouteBuilder(const GoogleMapsScreen());
        case ScreenName.otpVerificationNumberScreen:
          final phone = settings.arguments as String;
          return _animateRouteBuilder(OtpVerificationNumberScreen(phone: phone,));
        case ScreenName.forgetPasswordScreen:
          return _animateRouteBuilder(const ForgetPassword());
        case ScreenName.changeForgetPasswordScreen:
          final phone = settings.arguments as String;
          return _animateRouteBuilder(ChangeForgottenPassword(phone: phone,));
        case ScreenName.chatScreen:
          final chatScreenArgs = settings.arguments as ChatScreenArgs;
          return _animateRouteBuilder(ChatScreen(chatScreenArgs: chatScreenArgs,));
        case ScreenName.mainLayoutScreen:
          return _animateRouteBuilder(const MainLayout());
        case ScreenName.allSurvivalsScreen:
          return _animateRouteBuilder(const AllSurvivalsScreen());
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static PageRouteBuilder _animateRouteBuilder(Widget to, {double x = 1, double y = 0}) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => to,
      transitionDuration: const Duration(milliseconds: 190),
      reverseTransitionDuration: const Duration(milliseconds: 190),
      transitionsBuilder: (context, animation, animationTime, child) {
        final tween = Tween<Offset>(begin: Offset(x, y), end: Offset.zero);
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('خطأ'),
        ),
        body: const Center(
          child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
        ),
      );
    });
  }

}