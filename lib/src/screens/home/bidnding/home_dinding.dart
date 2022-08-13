import 'package:flutter_ecommerce/src/screens/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(),
    );
  }
}
