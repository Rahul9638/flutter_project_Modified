import 'dart:convert';

import 'package:http/http.dart' as http;

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
      // print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print("data-----------------${extractedData["data"]}");
      return extractedData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future isAuthorized(Map<String, String> otpData)async {
    const url = "http://staging-api.rapido.bid/api/v1/verify";
    try{
      final response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"token":otpData["token"],
      "otp":otpData["otp"]})
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(response.body);
      return extractedData;
    } catch (e){
      print(e);
      return null;
    }
  }
}
