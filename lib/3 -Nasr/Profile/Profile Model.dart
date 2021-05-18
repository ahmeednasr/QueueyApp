class ProfileModel {
  bool status;
  String errNum;
  String msg;
  List user;

  ProfileModel({this.status, this.errNum, this.msg, this.user});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    user = json['user'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    data['user'] = this.user;
    return data;
  }
}
