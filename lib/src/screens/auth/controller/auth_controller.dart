import 'package:flutter_ecommerce/src/screens/auth/repository/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final authRepository = AuthRepository();
  RxBool isLoading = false.obs;
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    //TODO signIn
    isLoading.value = true;
    await authRepository.signIn(email: email, password: password);
    isLoading.value = false;
  }
}
