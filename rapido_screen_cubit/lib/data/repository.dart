import 'package:rapido_screen/data/models/login_model.dart';
import 'package:rapido_screen/data/network_service.dart';
import './models/login_model.dart' as res;

import 'models/otp_model.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<LoginResponse> loginRequest(String countryCode, String phone) async {
    final loginData = {"phone": phone, "countryCode": countryCode};
    final loginRespone = await networkService.loginRequest(loginData);
    // print("Printing in the Repository ${loginRespone}");
    return LoginResponse.fromJson(loginRespone);
  }

  Future<OtpResponse> isAuthorized(String pin, String token) async{
    final otpData = {
      "token" : token,
      "otp" : pin
    };
    
    final otpResponse = await networkService.isAuthorized(otpData);
    print("Printing in the Repository ${otpResponse}");
    return OtpResponse.fromJson(otpResponse);
  }

  

}
