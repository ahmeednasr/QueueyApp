import 'dart:convert';
import 'package:dio/dio.dart';
import 'BookSlotModel.dart';

class BookSlotController {
  BookSlotModel _model = new BookSlotModel();
  Dio _dio = new Dio();
  List _list = [];
  Future getSlot() async {
    try {
      var _respons = await _dio.put('http://10.0.2.2:8000/api/service/getDate');
      if (_respons.statusCode == 200) {
        Map<String, dynamic> resp = json.decode(_respons.toString());
        _model = BookSlotModel.fromJson(resp);
        for (int i = 0; i < _model.appointment.length; i++) {
          _list.add({
            "id": _model.appointment[i].id,
            "time": _model.appointment[i].time,
            "lab": {
              "id": _model.appointment[i].lab.id,
              "date": _model.appointment[i].lab.date,
            }
          });
        }
        _list.sort((a, b) => (int.parse(a["lab"]["date"]))
            .compareTo(int.parse(b["lab"]["date"])));
        return _list;
      } else {}
    } catch (e) {}
  }

  BookedSlotModel _bookedSlotModel = new BookedSlotModel();
  bookSlot({int id}) async {
    try {
      var respons = await _dio.put(
        'http://10.0.2.2:8000/api/service/updateStatus?timelab_id=$id',
      );
      print(respons.data);

      if (respons.statusCode == 200) {
        Map<String, dynamic> resp = json.decode(respons.toString());
        _bookedSlotModel = BookedSlotModel.fromJson(resp);

        return _bookedSlotModel;
      } else {
        return _bookedSlotModel = null;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 500) {
        return _bookedSlotModel = null;
      } else {
        print(e.message);
      }
    }
  }
}
