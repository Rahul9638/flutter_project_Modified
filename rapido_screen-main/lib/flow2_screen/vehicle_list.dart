import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/flow2_screen/location_denied.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';

class VehicleList extends StatefulWidget {
  static const routeName = "/vehicle_list";

  @override
  _VehicleListState createState() => _VehicleListState();
}

LocationData currentLocation;
Location location;

LatLng sourceLocation = LatLng(23.4110039, 85.3392768);

class _VehicleListState extends State<VehicleList> {
  Location locationData = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  void initState() {
    _getLocation();

    super.initState();
  }

  Future<void> _getLocation() async {
    var locData = await Location().getLocation();
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("Unbale to fetch the next screeeeeeeeeeeeen");
        Navigator.pushNamed(context, LocationPermission.routeName);
      }
    }

    _locationData = await location.getLocation();
  }

  // Future<void> _acessChecker() async {
  //   var status = await Permission.location.status;

  // }

  var size, h, w;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    h = size.height;
    w = size.width;
    CameraPosition _intialCameraPosition = CameraPosition(
      zoom: 4,
      // tilt: 80,
      // bearing: 30,
      target: sourceLocation,
    );
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _intialCameraPosition,
          ),
          Positioned(
            child: Container(
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
                              top: h * 0.019,
                              left: w * 0.04,
                              child: Image.asset("assets/image/Vector.jpg"),
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
                                child:
                                    Image.asset('assets/image/Ellipse 15.png'),
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
                                          Image.asset(
                                              'assets/image/Vector 1.png'),
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
                                          Image.asset(
                                              'assets/image/Vector 1.png'),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          Image.asset(
                                              'assets/image/Vector 1.png'),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          Image.asset(
                                              'assets/image/Vector 1.png'),
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
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: w * 1,
              height: h * 0.3,
              // width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: w * 0.04),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromRGBO(255, 235, 54, 1),
                            child: ClipRect(
                              child: Image.asset(
                                "assets/image/Group 2010.png",
                                height: h * 0.030,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: w * 0.06),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Local Auto"),
                            SizedBox(
                              width: w * 0.4,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.info_outline),
                            ),
                            // Divider(thickness: 2,)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: w * 0.04),
                    child: Row(
                      // mainAxisAlignment:
                      //     MainAxisAlignment.start, //change here don't //worked
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromRGBO(255, 235, 54, 1),
                            child: ClipRect(
                              child: Image.asset(
                                "assets/image/local_taxi.png",
                                height: h * 0.02,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: w * 0.06),
                        Row(
                          children: [
                            Text("Local taxi"),
                            SizedBox(
                              width: w * 0.42,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.info_outline))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: w * 0.04),
                    child: Row(
                      // mainAxisAlignment:
                      //     MainAxisAlignment.start, //change here don't //worked
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromRGBO(255, 235, 54, 1),
                            child: ClipRect(
                              child: Image.asset(
                                "assets/image/intercity.png",
                                // height: h * 0.02,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: w * 0.06),
                        Row(
                          children: [
                            Text("Inter City"),
                            SizedBox(
                              width: w * 0.43,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.info_outline))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
