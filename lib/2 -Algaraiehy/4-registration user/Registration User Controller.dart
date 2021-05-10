import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:queuey/2%20-Algaraiehy/4-registration%20user/Registration%20User%20Model.dart';

class RegistrationUserController {
  RegistrationUserModel _registrationUserModel = new RegistrationUserModel();
  Dio _dio = new Dio();
  var _res;

  Future registrationUser(
      {String fullName,
      String email,
      String phone,
      String password,
      String role = '3'}) async {
    FormData _formData = FormData.fromMap({
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role
    });
    //real android -->>>> http://192.168.1.2:8000/api/user/register
    // emulator --->>>> http://10.0.2.2:8000/api/user/register
    try {
      var respons = await _dio.post('http://192.168.1.2:8000/api/user/register',
          data: _formData);
      print(respons.data);
      _res = respons.statusCode;
      if (respons.statusCode == 200) {
        Map<String, dynamic> resp = json.decode(respons.toString());
        _registrationUserModel = RegistrationUserModel.fromJson(resp);

        return _registrationUserModel;
      } else {
        return _registrationUserModel = null;
      }
    } catch (e) {
      print(e);
      return _registrationUserModel = null;
    }
  }

  getStatus() {
    return _res;
  }
}
