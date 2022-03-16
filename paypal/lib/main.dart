import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'MnM mobile Payment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("Pay"),
        onPressed: () async {
          var request = BraintreeDropInRequest(
            tokenizationKey: "sandbox_x67928j3_m77f4f45g9k387nr",
            collectDeviceData: true,
            paypalRequest:
                BraintreePayPalRequest(amount: "20.00", displayName: "MnM"),
            cardEnabled: true,
          );

          BraintreeDropInResult? result = await BraintreeDropIn.start(request);
          if (result != null) {
            print(
                "description of the payment:- ${result.paymentMethodNonce.description}");
            print("result of payment:- ${result.paymentMethodNonce.nonce}");
          }
        },
      )),
    );
  }
}
