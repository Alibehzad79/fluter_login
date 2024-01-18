import 'package:account_app/apis/account_api.dart';
import 'package:account_app/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountProvider extends ChangeNotifier {
  late Response response;
  late var status;
  late UserModel data;

  AccountProvider({this.status = 201});

  AccountApi accountApi = AccountApi();

  get_user_token(username, password) async {
    status = 204;
    notifyListeners();
    try {
      response = await accountApi.get_user_token(username, password);
      if (response.statusCode == 200) {
        status = 200;
        notifyListeners();
        data = UserModel.fromJson(response.data);
        notifyListeners();
      }
    } catch (e) {
      status = 400;
      notifyListeners();
    }
  }
}

class SaveLoginTokenProvider extends ChangeNotifier {
  late String token;
  bool haveToken = false;

  addToken(String _token) async {
    final prefs = await SharedPreferences.getInstance();
    token = _token;
    haveToken = true;
    prefs.setString("token", token);
    prefs.setBool("haveToken", haveToken);
    notifyListeners();
  }

  removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = "";
    haveToken = false;
    prefs.setString("token", token);
    prefs.setBool("haveToken", haveToken);
    notifyListeners();
  }
}
