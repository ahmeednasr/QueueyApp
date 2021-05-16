import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:queuey/2%20-Algaraiehy/4-registration%20user/Registration%20User%20Model.dart';

class RegistrationUserController {
  RegistrationUserModel _registrationUserModel = new RegistrationUserModel();
  Dio _dio = new Dio();

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

    try {
      var respons = await _dio.post(
          'https://queue4.herokuapp.com/api/user/register',
          data: _formData);
      print(respons.data);

      if (respons.statusCode == 200) {
        Map<String, dynamic> resp = json.decode(respons.toString());
        _registrationUserModel = RegistrationUserModel.fromJson(resp);

        return _registrationUserModel;
      } else {
        return _registrationUserModel = null;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 500) {
        return _registrationUserModel = null;
      } else {
        print(e.message);
      }
    }
  }
}
