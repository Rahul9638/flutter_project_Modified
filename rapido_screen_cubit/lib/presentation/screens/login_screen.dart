import 'dart:io' show Platform;

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapido_screen/constant/strings.dart';
import 'package:rapido_screen/cubit/login_cubit.dart';
import 'package:rapido_screen/data/models/login_model.dart';

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

  Widget cupertButton(context) {
    return CupertinoButton(
      child: Text(
        'Verify',
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black),
      ),
      color: _color ? Colors.yellow : Colors.black26,
      onPressed: () {},
    );
  }

  Widget andriodButton(BuildContext context,) {
    return FlatButton(
      child: Text(
        'Verify',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
      ),
      color: _color ? Colors.yellow : Colors.black26,
      textColor: Colors.black,
      onPressed: () {
        BlocProvider.of<LoginCubit>(context)
            .loginRequest("91", _numberController.text);
        Navigator.pushNamed(context, OTP_SCREEN_ROUTE,);
      },
    );
  }

  Widget layoutBoth(context) {
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
              child: Platform.isAndroid
                  ? andriodButton(context, )
                  : cupertButton(context),
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
            body: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                // final LoginResponse loginData;
                var loginData;
                if (state is LoginSuccess) {
                  final loginData = (state as LoginSuccess).loginResponse;
                  // print("fetching the data Through the Cubit state ${loginData}");
                }

                return SingleChildScrollView(
                  child: layoutBoth(context,),
                );
              },
            ),
          )
        : CupertinoPageScaffold(
            child: SingleChildScrollView(
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  var loginData = (state as LoginSuccess).loginResponse;
                  return layoutBoth(context);
                },
              ),
              //
            ),
          );
  }
}
