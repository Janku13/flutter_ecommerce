import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/app/routes.dart';
import 'package:flutter_ecommerce/src/config/custom_colors.dart';
import 'package:flutter_ecommerce/src/widgets/app_title.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(PagesNames.loginScreen);
      // Navigator.popAndPushNamed(context, PagesNames.loginScreen);
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (ctx) {
      //     return const SignInScreen();
      //   }),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              CustomColors.customSwatchColor.shade700,
              CustomColors.customSwatchColor.shade900,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AppTitle(
              greenTitleColor: Colors.white,
              titleSize: 40,
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
