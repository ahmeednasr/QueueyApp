import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:queuey/3%20-Nasr/Login/Login%20Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  LoginModel _model = new LoginModel();

  Dio _dio = new Dio();
  Future login({String email, String password}) async {
    FormData _formdata =
        FormData.fromMap({'email': email, 'password': password});
    try {
      var respons = await _dio
          .post('https://queue4.herokuapp.com/api/user/login', data: _formdata);
      print(respons);
      if (respons.statusCode == 200) {
        Map<String, dynamic> resp = json.decode(respons.toString());
        if (resp['errNum'] == '201') {
          _model = LoginModel.fromJson(resp);
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          _prefs.setString('token', _model.userToken);
          return _model;
        }
        if (resp['errNum'] == '404') {
          _model = LoginModel.fromJson(resp);
          return _model;
        }
      } else {}
    } catch (e) {}
  }
}
