import 'dart:io' show Platform;

  
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/login_response_data.dart';
import './otp_screen_default.dart';
import './information_scree.dart';
import '../Model/login_data.dart';

import '../Api/login_screen_model.dart';

// import './flow1_screen/otp_screen_default.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

void CheckValidate(_numberController) {}

class _LoginScreenState extends State<LoginScreen> {
  var size, h, w;
  final _formKey = GlobalKey<FormState>();
  var _color = false;
  var _validatePhoneInput = false;
  final _numberController = TextEditingController();
  Color _color1 = Colors.black;
  FocusNode myFocusNode = new FocusNode();
  LoginResponse _loginResponse;

  @override
  void initState() {
    super.initState();
    print("Printing the in Init of LoginScreen");
    setState(() {
      FocusNode myFocusNode = new FocusNode();
    });
  }

  void lengthChecker() {
    if (_numberController.text.length >= 10) {
      setState(() {
        _color = true;
      });
    } else {
      setState(() {
        _color = false;
        // _validatePhoneInput = false;
      });
    }
  }

  Widget getTextAndr() {
    return TextFormField(
      focusNode: myFocusNode,
      maxLength: 10,

      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            value.length < 10 ||
            value.length > 10) {
          return 'Number Invalid';
        }
        return null;
      },
      onChanged: (_) => lengthChecker(),
      // initialValue: "+91",

      controller: _numberController,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.red),
        contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        counterText: "",
        prefixIcon: SizedBox(
          width: 50,
          child: Center(
            child: Text(
              "+91",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        label: Text(
          "Phone Number",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _validatePhoneInput ? Colors.red : Colors.green),
        ),
        // hintText: "Phone Number",
        border: OutlineInputBorder(),
        focusColor: Colors.green,
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Colors.black45 : Colors.green),
        focusedBorder: OutlineInputBorder(
            borderSide: _validatePhoneInput
                ? new BorderSide(color: Colors.red)
                : new BorderSide(color: Colors.green)),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }

  Widget cupertinoField() {
    return CupertinoTextField(
      // padding: EdgeInsets.only(top: 13),
      decoration: BoxDecoration(
          border: _validatePhoneInput
              ? Border.all(color: Colors.red)
              : Border.all(color: Colors.black54)),
      placeholder: "Phone number",
      prefix: SizedBox(
        width: 50,
        child: Center(
          child: Text(
            "+91",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      maxLength: 10,
      onChanged: (_) => lengthChecker(),
      controller: _numberController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }

  Widget cupertButton() {
    return CupertinoButton(
      child: Text(
        'Verify',
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black),
      ),
      color: _color ? Colors.yellow : Colors.black26,
      onPressed: () {
        if (_color) {
          Navigator.pushNamed(context, OtpScreen.routeName);
        } else {
          setState(() {
            _validatePhoneInput = true;
          });
        }
      },
    );
  }

//   Future<String> get _localPath async {
//   final directory = await getApplicationDocumentsDirectory();

//   return directory.path;
// }

  var _token;

  Future<void> submit() async {
  //   _loginResponse =
  //       await Provider.of<LoginAuthenticate>(context, listen: false)
  //           .getUserLoginDetails(_numberController.text, "+91");
  //   _token = _loginResponse.data.token;
  //   print(" Locally generated token $_token");
  // final prefs = await SharedPreferences.getInstance();
  //  final userToken = json.encode({
  //     'token': _token,
  //   });
  //   prefs.setString('userData', userToken);

    
  }

  Widget andriodButton() {
    return FlatButton(
      child: Text(
        'Verify',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
      ),
      color: _color ? Colors.yellow : Colors.black26,
      textColor: Colors.black,
      onPressed: () async {
        // Validate returns true if the form is valid, or false otherwise.
        if (_color) {
          // submit();
           _loginResponse =
        await Provider.of<LoginAuthenticate>(context, listen: false)
            .getUserLoginDetails(_numberController.text, "+91");
    _token = _loginResponse.data.token;
    print(" Locally generated token $_token");
  final prefs = await SharedPreferences.getInstance();
   final userToken = json.encode({
      'token': _token,
    });
    prefs.setString('userData', userToken);

          Duration(milliseconds: 3);
          Navigator.pushNamed(
      context,
      OtpScreen.routeName,
      
    );

        } else {
          setState(() {
            _validatePhoneInput = true;
          });
        }
      },
    );
  }

  Widget layoutBoth() {
    return Container(
      margin: EdgeInsets.only(left: w * 0.04, top: h * 0.1),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                    "Login to Your account",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                      height: Platform.isIOS ? h * 0.05 : null,
                      width: w * 0.911,
                      child: Platform.isAndroid
                          ? getTextAndr()
                          : cupertinoField()),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                    height: 0.031 * h,
                    // width: 0.45 *
                    margin: EdgeInsets.only(right: w * 0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Otp will be sent to the Number",
                          // textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 12),
                        ),
                        _validatePhoneInput
                            ? Text("Invalid Number",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12))
                            : Text(""),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.23),
            Container(
              margin: EdgeInsets.only(right: w * 0.04),
              height: h * 0.075,
              // width: double.infinity,
              width: w * 0.91,
              // Buttton resemble here.
              child: Platform.isAndroid ? andriodButton() : cupertButton(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(_numberController.text);
    size = MediaQuery.of(context).size;
    h = size.height;
    w = size.width;
    return Platform.isAndroid
        ? Scaffold(
            body: SingleChildScrollView(
              child: layoutBoth(),
            ),
          )
        : CupertinoPageScaffold(
            child: SingleChildScrollView(
              child: layoutBoth(),
              //
            ),
          );
  }
}
