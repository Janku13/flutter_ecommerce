import 'package:flutter_ecommerce/src/screens/auth/view/sign_in_screen.dart';
import 'package:flutter_ecommerce/src/screens/auth/view/sign_up_screen.dart';
import 'package:flutter_ecommerce/src/screens/base/base_screen.dart';
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
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PagesNames.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: PagesNames.baseScreen,
      page: () => const BaseScreen(),
    ),
  ];
}

abstract class PagesNames {
  static String splashScreen = '/splash';
  static String loginScreen = '/login';
  static String signUpScreen = '/cadastro';
  static String baseScreen = '/';
}
