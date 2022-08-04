import 'package:flutter_ecommerce/src/screens/auth/sign_in_screen.dart';
import 'package:flutter_ecommerce/src/screens/auth/sign_up_screen.dart';
import 'package:flutter_ecommerce/src/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesNames.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PagesNames.loginScreen,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: PagesNames.signUpScreen,
      page: () => SignUpScreen(),
    ),
  ];
}

abstract class PagesNames {
  static String splashScreen = '/splash';
  static String loginScreen = '/login';
  static String signUpScreen = '/cadastro';
}
