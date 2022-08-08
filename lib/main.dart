import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/app/routes.dart';
import 'package:flutter_ecommerce/src/screens/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color.fromARGB(255, 231, 229, 229)),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesNames.splashScreen,
      getPages: AppPages.pages,
    );
  }
}
