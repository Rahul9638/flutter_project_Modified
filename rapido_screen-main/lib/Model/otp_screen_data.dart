import 'dart:convert';
class OtpData {
  Data data;
  int status;
  String message;

  OtpData ({this.data, this.status, this.message});

  factory OtpData.fromJson(Map<String,dynamic> json){
    return OtpData(
      data: Data.fromJson(json["data"]),
      status: json["status"],
      message: json["message"],
    );
  }

}

class Data {
  
    Data({
        this.accessToken,
    });

    String accessToken;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
    );

    
}
