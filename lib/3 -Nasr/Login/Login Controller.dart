import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:queuey/3%20-Nasr/Login/Login%20Model.dart';

class LoginController {
  LoginModel _model = new LoginModel();

  Dio _dio = new Dio();
  Future login({String email, String password}) async {
    FormData _formdata =
        FormData.fromMap({'email': email, 'password': password});
    try {
      var respons = await _dio.post('http://10.0.2.2:8000/api/user/login',
          data: _formdata);
      if (respons.statusCode == 200) {
        Map<String, dynamic> resp = json.decode(respons.toString());
        if (resp['errNum'] == '201') {
          _model = LoginModel.fromJson(resp);
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
