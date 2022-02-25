// To parse this JSON data, do
//
//     final LoginResponse = LoginResponseFromMap(jsonString);

import 'dart:convert';

class LoginResponse {
  LoginResponse({
    this.data,
    this.status,
    this.message,
  });

  Data data;
  int status;
  String message;

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        data: Data.fromMap(json["data"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
        "status": status,
        "message": message,
      };
}

class Data {
  Data({
    this.token,
  });

  String token;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
