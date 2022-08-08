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
  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  void saveTokenAndGoBase() {
    _utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);
    Get.offAllNamed(PagesNames.baseScreen);
  }

  Future<void> validateToken() async {
    //get token
    String? token = await _utilsServices.getLocalData(key: StorageKeys.token);
    if (token == null) {
      Get.offAllNamed(PagesNames.loginScreen);
      return;
    }
    AuthResult result = await authRepository.validateToken(token);
    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndGoBase();
      },
      error: (mesg) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    user = UserModel();
    _utilsServices.removeLocalData(key: StorageKeys.token);
    Get.offAllNamed(PagesNames.loginScreen);
  }

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
        saveTokenAndGoBase();
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
