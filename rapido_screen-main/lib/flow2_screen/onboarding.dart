import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/flow2_screen/vehicle_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './vehicle_list.dart';

class Onboarding extends StatefulWidget {
  static const routeName = '/onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller =
      PageController(viewportFraction: 0.8, keepPage: false, initialPage: 0);

  var h, w, size;
  var _index = 1;

  Widget layout() {
    return Column(
      children: [
        Center(
          child: Image.asset(
            "assets/image/Ellipse 19.png",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: h * 0.05,
        ),
        Center(
          child: Text(
            "Lorem ipsum don",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: h * 0.025),
        Container(
          height: h * 0.084,
          margin: EdgeInsets.only(
            left: 0.1 * w,
            right: 0.1 * w,
          ),
          child: Center(
            child: Text(
              "amet, consectetur adipi pharetra nisla, sapien sed consequat.",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    h = size.height;
    w = size.width;

    final pages = List.generate(3, (index) => layout());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: h * 0.05),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _index > 1
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _index--;
                            });
                            controller.previousPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.bounceIn,
                            );
                          },
                          child: Container(
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
                        )
                      : Text(""),
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
                                top: h * 0.024,
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
              SizedBox(height: h * 0.06),
              SizedBox(
                height: h * (264 / 640),
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (_, _index) {
                    return pages[_index % pages.length];
                  },
                ),
              ),
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: CustomizableEffect(
                    activeDotDecoration: DotDecoration(
                      width: 32,
                      height: 12,
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    dotDecoration: DotDecoration(
                      width: 12,
                      height: 12,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      verticalOffset: 0,
                    ),
                    spacing: 6.0,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.064,
              ),
              _index > 2
                  ? Container(
                      width: w * 0.91,
                      height: h * 0.075,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, VehicleList.routeName);
                        },
                        child: Text(
                          "Start",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(249, 216, 21, 1))),
                      ),
                    )
                  : GestureDetector(
                      child: Container(
                        height: 83,
                        width: 83,
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: h * 0.02,
                                top: h * 0.0001,
                                left: 0.00001,
                                right: h * 0.020,
                                child:
                                    Image.asset("assets/image/Ellipse 17.png")),
                            Positioned(
                              top: h * 0.035,
                              left: w * 0.055,
                              child: Image.asset("assets/image/Vector (1).png"),
                            ),
                            Positioned(
                              bottom: h * 0.02,
                              // top: h * 0.0001,
                              left: 0.00001,

                              right: h * 0.020,
                              child: CircularPercentIndicator(
                                progressColor: Color.fromRGBO(244, 190, 62, 1),
                                fillColor: Colors.transparent,
                                percent: _index >= 2 ? 0.6 : 0.3,
                                lineWidth: 3,
                                radius: 70,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          print(_index);
                          _index++;
                        });
                        controller.nextPage(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.bounceIn,
                        );
                      },
                    ),
              SizedBox(
                height: h * 0.037,
              ),
              _index > 2
                  ? Text("")
                  : Container(
                      child: Text("SKIP"),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
