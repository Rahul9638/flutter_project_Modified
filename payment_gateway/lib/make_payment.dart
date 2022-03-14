import 'package:flutter/material.dart';
import 'package:payment_gateway/paypal_payment.dart';

class MakePayment extends StatefulWidget {
  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PayPal"),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("Pay"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PaypalPayment(
                onFinish: (number) async {
                  print("Order Id " + number);
                },
              ),
            ),
          );
        },
      )),
    );
  }
}
