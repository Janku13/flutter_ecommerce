const String baseUrl = 'https://parseapi.back4app.com/functions';

abstract class Endpoints {
  static const String signin = '$baseUrl/login';
  static const String signup = '$baseUrl/signup';
  static const String validateToken = '$baseUrl/validate-token';
}

// ignore: constant_identifier_names
enum HttpMethods { PUT, GET, POST, PATCH, DELETE }
