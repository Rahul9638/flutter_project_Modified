import 'dart:convert';

class LoginRequest {
  LoginRequest({
    this.phone,
    this.countryCode,
  });

  String phone;
  String countryCode;

  factory LoginRequest.fromMap(Map<String, dynamic> json) => LoginRequest(
        phone: json["phone"],
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "countryCode": countryCode,
      };
}
