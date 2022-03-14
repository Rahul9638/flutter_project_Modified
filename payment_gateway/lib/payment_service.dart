import 'package:http/http.dart' as http;
import 'package:http_auth/http_auth.dart';
import 'dart:convert' as convert;

class PaypalServices {
  String domain = "https://api.sandbox.paypal.com";
  String clientId =
      "AVK9xvjp1nq1PQFGqBbmdHwteGrqxKX_82xfVSlu265UUUtOHAw7vCn3PZGqlEIW5xnIyMzSDqafgF_f";
  String secret =
      "EE20XDwZidPzAtXXczgzhyoZyQfkZQFgkn0dHDQsvCGFi1j6Ek2pv9gDLRh307s-PzRdbUmvhm7inDmI";
  Future<String?> getAccessToken() async {
    try {
      var client = BasicAuthClient(clientId, secret);
      var response = await client.post(
          Uri.parse("$domain/v1/oauth2/token?grant_type=client_credentials"));
      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body);
        return body['access_token'];
      }
      return "0";
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, String>> createPayPalPayment(
      transaction, accessToken) async {
    try {
      var response = await http.post(
        Uri.parse("$domain/v1/payments/payment"),
        body: convert.jsonEncode(transaction),
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer ' + accessToken
        },
      );
      final body = convert.jsonDecode(response.body);
      // print("Printing in the create method of payPalPayment: $body");
      if (response.statusCode == 201) {
        if (body["links"] != null && body['links'].length > 0) {
          List links = body['links'];
          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "approval_url",
              orElse: (() => null));
          if (item != null) {
            approvalUrl = item["href"];
          }
          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: (() => null));
          if (item != null) {
            executeUrl = item1["href"];
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }
        throw Exception("0");
      } else {
        throw Exception(body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> executePayment(url, payerId, accessToken) async {
    try {
      var response = await http.post(url,
          body: convert.jsonEncode({"payer_id": payerId}),
          headers: {
            "content-type": "application/json",
            "Authorization": "Bearer" + accessToken
          });
      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        return body["id"];
      }
      return "0";
    } catch (e) {
      rethrow;
    }
  }
}
