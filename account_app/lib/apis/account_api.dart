import 'package:dio/dio.dart';

class AccountApi {
  Future<Response> get_user_token(username, password) async {
    final String api = "http://localhost:8000/api/v1/token/";
    Response response = await Dio().post(
      api,
      data: {"username": username, "password": password},
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
    );
    return response;
  }
}
