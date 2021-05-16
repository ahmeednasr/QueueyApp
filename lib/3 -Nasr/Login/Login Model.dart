class LoginModel {
  bool status;
  String errNum;
  String msg;
  String token;

  LoginModel({this.status, this.errNum, this.msg, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    data['token'] = this.token;
    return data;
  }
}
