class BookSlotModel {
  bool status;
  String errNum;
  String msg;
  List<Appointment> appointment;

  BookSlotModel({this.status, this.errNum, this.msg, this.appointment});

  BookSlotModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Appointment'] != null) {
      appointment = <Appointment>[];

      json['Appointment'].forEach((v) {
        appointment.add(new Appointment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.appointment != null) {
      data['Appointment'] = this.appointment.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appointment {
  int id;
  String time;
  int active;
  Lab lab;

  Appointment({this.id, this.time, this.active, this.lab});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    active = json['active'];
    lab = json['lab'] != null ? new Lab.fromJson(json['lab']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['time'] = this.time;
    data['active'] = this.active;
    if (this.lab != null) {
      data['lab'] = this.lab.toJson();
    }
    return data;
  }
}

class Lab {
  int id;
  String date;

  Lab({this.id, this.date});

  Lab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    return data;
  }
}

class BookedSlotModel {
  bool status;
  String errNum;
  String msg;

  BookedSlotModel({this.status, this.errNum, this.msg});

  BookedSlotModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    return data;
  }
}
