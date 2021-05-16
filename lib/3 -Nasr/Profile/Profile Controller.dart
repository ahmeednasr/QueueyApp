import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:queuey/3%20-Nasr/Profile/Profile%20Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController {
  Dio _dio = new Dio();
  ProfileModel _profileModel = new ProfileModel();
  Future getUserData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      _dio.options.headers["Authorization"] =
          "Bearer ${_prefs.getString('token')}";
      var respons = await _dio.get('http://10.0.2.2:8000/api/user/profile');
      print(respons);
      if (respons.statusCode == 200) {
        Map<String, dynamic> resp = json.decode(respons.toString());
        _profileModel = ProfileModel.fromJson(resp);
        return _profileModel;
      } else {}
    } catch (e) {}
  }
}
