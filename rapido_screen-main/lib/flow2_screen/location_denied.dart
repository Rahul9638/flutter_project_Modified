import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class LocationPermission extends StatefulWidget {
  static const routeName = '/location_permission';
  @override
  _LocationPermissionState createState() => _LocationPermissionState();
}

var size, h, w;

class _LocationPermissionState extends State<LocationPermission> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    h = size.height;
    w = size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: h * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: w * 0.04),
                  child: Stack(
                    children: [
                      Image.asset("assets/image/Ellipse 15.png"),
                      Positioned(
                        top: h * 0.02,
                        left: w * 0.04,
                        child: Image.asset("assets/image/Vector.png"),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 0.02 * w),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          child: Image.asset('assets/image/Ellipse 15.png'),
                          onTap: () {},
                        ),
                      ),
                      Platform.isIOS
                          ? Positioned(
                              top: h * 0.015,
                              left: w * 0.036,
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Image.asset('assets/image/Vector 1.png'),
                                    SizedBox(
                                      height: h * 0.005,
                                    ),
                                    Image.asset('assets/image/Vector 1.png'),
                                    SizedBox(
                                      height: h * 0.005,
                                    ),
                                    Image.asset('assets/image/Vector 1.png'),
                                  ],
                                ),
                                onTap: () {
                                  Drawer();
                                },
                              ),
                            )
                          : Positioned(
                              top: h * 0.019,
                              left: w * 0.042,
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Image.asset('assets/image/Vector 1.png'),
                                    SizedBox(
                                      height: h * 0.005,
                                    ),
                                    Image.asset('assets/image/Vector 1.png'),
                                    SizedBox(
                                      height: h * 0.005,
                                    ),
                                    Image.asset('assets/image/Vector 1.png'),
                                  ],
                                ),
                                onTap: () {
                                  Drawer(
                                    child: Column(
                                      children: [Text("data")],
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.07),
            Center(
              child: Image.asset('assets/image/locationPermission.jpg'),
            ),
            SizedBox(height: h * 0.048),
            Center(
              child: Text(
                "Oops!",
                style: TextStyle(
                    color: Color.fromRGBO(32, 33, 34, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: h * 0.02),
            Center(
              child: Text(
                "Seems Like you have denied location access",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(115, 115, 115, 1),
                ),
              ),
            ),
            SizedBox(height: h * 0.025),
            Center(
              child: Text(
                "We cannot proceed without permission",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 0, 0, 1),
                ),
              ),
            ),
            SizedBox(height: 0.235 * h),
            Container(
              height: h * 0.125,
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.only(
                      left: w * 0.04,
                      right: w * 0.04,
                      top: h * 0.025,
                      bottom: h * 0.025),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(254, 204, 9, 0.8))),
                    child: Text(
                      "Give Permission",
                      style: TextStyle(
                          color: Color.fromRGBO(12, 13, 15, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
