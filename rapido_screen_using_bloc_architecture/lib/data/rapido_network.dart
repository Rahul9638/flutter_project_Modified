import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkService {
  Future loginRequest(Map<String, String> loginData) async {
    const url = "http://staging-api.rapido.bid/api/v1/login";
    try {
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "phone": loginData["phone"],
            "countryCode": loginData["countryCode"]
          }));
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      print(responseData);
      return responseData;
    } catch (error) {
      print(error);
    }
  }

  Future checkAuthorized(Map<String, String> otpVerificationData) async {
    const url = "http://staging-api.rapido.bid/api/v1/verify";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "token": otpVerificationData["token"],
            "otp": otpVerificationData["otp"],
          },
        ),
      );
      print(response.body);
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      print("responseData");
      return responseData;
    } catch (error) {
      print(error);
    }
  }
}
