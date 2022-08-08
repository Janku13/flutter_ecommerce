import 'package:flutter_ecommerce/src/app/routes.dart';
import 'package:flutter_ecommerce/src/models/user_model.dart';
import 'package:flutter_ecommerce/src/screens/auth/repository/auth_repository.dart';
import 'package:flutter_ecommerce/src/screens/auth/result/auth_result.dart';
import 'package:flutter_ecommerce/src/services/utils_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final authRepository = AuthRepository();
  final _utilsServices = UtilsServices();
  UserModel user = UserModel();
  RxBool isLoading = false.obs;
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    AuthResult result =
        await authRepository.signIn(email: email, password: password);
    isLoading.value = false;
    result.when(
      success: (user) {
        this.user = user;
        Get.offAllNamed(PagesNames.baseScreen);
      },
      error: (message) {
        _utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
