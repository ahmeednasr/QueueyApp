class LoginModel {
  bool status;
  String errNum;
  String msg;
  int userId;
  String userToken;

  LoginModel({this.status, this.errNum, this.msg, this.userId, this.userToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    userId = json['user_id'];
    userToken = json['user_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    data['user_id'] = this.userId;
    data['user_token'] = this.userToken;
    return data;
  }
}
