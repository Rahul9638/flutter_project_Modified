import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/login_response_data.dart';
import '../Model/otp_screen_data.dart';

class LoginAuthenticate with ChangeNotifier {
  // List<LoginScreenModelView> _login = [];

  Future<LoginResponse> getUserLoginDetails(
      String phoneNumber, String countryCode) async {
    const url = "http://staging-api.rapido.bid/api/v1/login";
    var response;
    try {
      response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "phone": phoneNumber,
            "countryCode": countryCode,
          }));

      if (response != null) {
        // print(json.decode(response.body));
        return LoginResponse.fromMap(json.decode(response.body));
      } else {
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  Future<OtpData> otpResponse(String token, String otp) async {

    const url = "http://staging-api.rapido.bid/api/v1/verify";

    var otpResponse;
    try {
      otpResponse = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "token": token,
            "otp": otp,
          }));

      if (otpResponse != null) {
        print(json.decode(otpResponse.body));
        return OtpData.fromJson(json.decode(otpResponse.body));
      } else {
        return null;
      }
    } catch (error) {
      throw error;
    }
  }
}
