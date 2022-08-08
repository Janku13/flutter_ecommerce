import 'package:flutter_ecommerce/src/models/user_model.dart';
import 'package:flutter_ecommerce/src/screens/auth/repository/auth_errors.dart'
    as autherror;
import 'package:flutter_ecommerce/src/screens/auth/result/auth_result.dart';
import 'package:flutter_ecommerce/src/services/api/api_constants.dart';
import 'package:flutter_ecommerce/src/services/api/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManager
        .restRequest(url: Endpoints.signin, method: HttpMethods.POST, body: {
      "email": email,
      "password": password,
    });
    print(result);
    if (result["result"] != null) {
      final user = UserModel.fromJson(result["result"]);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(autherror.authErrorsString(result['error']));
    }
  }
}
