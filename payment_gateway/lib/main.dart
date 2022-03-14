import 'package:flutter/material.dart';
import 'package:payment_gateway/make_payment.dart';

void main() {
  runApp(PayPalImplementation());
}

class PayPalImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PayPal",
      home: MakePayment(),
    );
  }
}
