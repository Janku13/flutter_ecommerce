import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/src/services/api/api_constants.dart';

class HttpManager {
  Future<Map> restRequest({
    required Endpoints url,
    required HttpMethods method,
    Map? headers,
    Map? body,
  }) async {
    Dio dio = Dio();

    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'g1Oui3JqxnY4S1ykpQWHwEKGOe0dRYCPvPF4iykc',
        'X-Parse-REST-API-Key': 'rFBKU8tk0m5ZlKES2CGieOaoYz6TgKxVMv8jRIsN',
      });
    try {
      Response response = await dio.request(
        '$baseUrl/$url',
        options: Options(
          headers: defaultHeaders,
          method: method.name,
        ),
        data: body,
      );
      return response.data;
    } on DioError catch (error) {
      return error.response?.data ?? {};
    } catch (error) {
      return {error: error};
    }
  }
}
