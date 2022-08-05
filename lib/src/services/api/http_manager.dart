import 'package:dio/dio.dart';

const String baseUrl = 'https://parseapi.back4app.com';

// ignore: constant_identifier_names
enum HttpMethods { PUT, GET, POST, PATCH, DELETE }

class HttpManager {
  Future restRequest({
    required String url,
    required HttpMethods method,
    Map? headers,
  }) async {
    Dio dio = Dio();

    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'g1Oui3JqxnY4S1ykpQWHwEKGOe0dRYCPvPF4iykc',
        'X-Parse-REST-API-Key': 'rFBKU8tk0m5ZlKES2CGieOaoYz6TgKxVMv8jRIsN',
      });
    dio.request(
      '$baseUrl/$url',
      options: Options(
        headers: defaultHeaders,
        method: method.name,
      ),
    );
  }
}
