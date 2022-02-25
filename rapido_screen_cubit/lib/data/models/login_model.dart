// To parse this JSON data, do
//
//     final LoginResponse = LoginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse LoginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String LoginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        required this.data,
        required this.status,
        required this.message,
    });

    Data data;
    int status;
    String message;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
        "message": message,
    };
}

class Data {
    Data({
        required this.token,
    });

    String token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
