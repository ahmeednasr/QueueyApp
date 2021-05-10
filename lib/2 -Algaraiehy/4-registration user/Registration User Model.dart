class RegistrationUserModel {
  bool status;
  String errNum;
  String msg;
  User user;

  RegistrationUserModel({this.status, this.errNum, this.msg, this.user});

  RegistrationUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String fullName;
  String email;
  String phone;
  Null title;
  Null busName;
  String role;
  Null busCategory;
  Null busPhone;
  Null busEmail;
  Null busWebsite;
  String updatedAt;
  String createdAt;
  int id;

  User(
      {this.fullName,
      this.email,
      this.phone,
      this.title,
      this.busName,
      this.role,
      this.busCategory,
      this.busPhone,
      this.busEmail,
      this.busWebsite,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    title = json['title'];
    busName = json['busName'];
    role = json['role'];
    busCategory = json['busCategory'];
    busPhone = json['busPhone'];
    busEmail = json['busEmail'];
    busWebsite = json['busWebsite'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['title'] = this.title;
    data['busName'] = this.busName;
    data['role'] = this.role;
    data['busCategory'] = this.busCategory;
    data['busPhone'] = this.busPhone;
    data['busEmail'] = this.busEmail;
    data['busWebsite'] = this.busWebsite;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
