import 'package:flutter_ecommerce/src/services/api/api_constants.dart';
import 'package:flutter_ecommerce/src/services/api/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future<Map> signIn({required String email, required String password}) async {
    final result = await _httpManager
        .restRequest(url: Endpoints.signin, method: HttpMethods.POST, body: {
      "email": email,
      "password": password,
    });
    if (result["result"] != null) {
      return result;
    } else {
      return {'error': 'a'};
    }
  }
}
