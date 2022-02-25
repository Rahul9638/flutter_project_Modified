import 'package:flutter/foundation.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'dart:io' show Platform;

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './flow1_screen/login_widget.dart';
import '/flow1_screen/splash_screen.dart';
import '/flow1_screen/otp_screen_default.dart';
import '/flow1_screen/information_scree.dart';
import './flow2_screen/onboarding.dart';
import './flow2_screen/vehicle_list.dart';
import '../flow2_screen/location_denied.dart';
import './Api/login_screen_model.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (ctx) => LoginAuthenticate(),
              ),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              // home: HomePage(),
              // home: VehicleList(),
              debugShowCheckedModeBanner: false,
              // home: Onboarding(),
              // home: LocationPermission(),
              home: SplashScreen(),
              routes: {
                OtpScreen.routeName: (ctx) => OtpScreen(),
                InformationScreen.routeName: (ctx) => InformationScreen(),
                Onboarding.routeName: (ctx) => Onboarding(),
                VehicleList.routeName: (ctx) => VehicleList(),
                LocationPermission.routeName: (ctx) => LocationPermission()
              },
            ),
          )
        : CupertinoApp(
            home: SplashScreen(),
            routes: {
              OtpScreen.routeName: (ctx) => OtpScreen(),
              InformationScreen.routeName: (ctx) => InformationScreen(),
            },
          );
  }
}
