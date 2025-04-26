class LoginModel {
  String? status;
  String? message;
  Result? result;

  LoginModel({this.status, this.message, this.result});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? id;
  String? userName;
  String? email;
  String? password;
  String? createdAt;
  Null? deviceId;
  String? accessToken;

  Result(
      {this.id,
        this.userName,
        this.email,
        this.password,
        this.createdAt,
        this.deviceId,
        this.accessToken});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
    deviceId = json['device_id'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['device_id'] = this.deviceId;
    data['access_token'] = this.accessToken;
    return data;
  }
}
