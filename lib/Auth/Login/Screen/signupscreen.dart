import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helioz/Auth/Login/widgets/buildtextfield.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:helioz/common/widgets/slideanimation.dart';

import 'loginscreen.dart';

String? groupValue = '';
bool _obscureText = true;

class WRSingup1 extends StatefulWidget {
  @override
  _WRSingup1State createState() => _WRSingup1State();
}

class _WRSingup1State extends State<WRSingup1>
    with SingleTickerProviderStateMixin {
  final blueColor = Color(0XFF5e92f3);
  final yellowColor = Color(0XFFfdd835);

  TapGestureRecognizer? _tapGestureRecognizer;

  // bool _showSignIn;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    // _showSignIn = true;
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (BuildContext context) => WRLogin1()));
        Navigator.pushReplacementNamed(context, "/login");
      };
  }

  @override
  void dispose() {
    _tapGestureRecognizer!.dispose();
    super.dispose();
  }

  AnimationController? _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 8),
                    height: MediaQuery.of(context).size.width / 1.4,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/images/shape.svg",
                          color: ColorsRes.newAppColor,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width / 1.4,
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/Helioz_logo_blau_claim_RGB_-2.png",
                                // fit: BoxFit.cover,
                                color: ColorsRes.logoColor,
                                width: MediaQuery.of(context).size.width / 3.8,
                              ),
                              SizedBox(height: 10.0),
                              // Text(
                              //   "Music",
                              //   style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: 28,
                              //       fontWeight: FontWeight.bold),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.0),
                        SlideAnimation(
                          position: 1,
                          itemCount: 8,
                          slideDirection: SlideDirection.fromLeft,
                          animationController: _animationController,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: ColorsRes.newAppColor,
                                fontSize: 18,
                                fontFamily: "Futura",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          child: SingleChildScrollView(
                            child: buildSignUpTextFieldSection(),
                          ),
                        ),
                        buildSingUpBottomSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Container buildSingUpBottomSection() {
    return Container(
      child: Column(
        children: [
          SlideAnimation(
            position: 5,
            itemCount: 7,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                primary: ColorsRes.newAppColor,
                elevation: 1.0,
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SING UP",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: "Futura",
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SlideAnimation(
            position: 7,
            itemCount: 8,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: RichText(
              text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: "Log in",
                        recognizer: _tapGestureRecognizer,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorsRes.newAppColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Futura"))
                  ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Column buildSignUpTextFieldSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SlideAnimation(
          position: 2,
          itemCount: 8,
          slideDirection: SlideDirection.fromLeft,
          animationController: _animationController,
          // child: buildTextField("USERNAME", "Demo", false),
          child: const BuildTextField(
            labelText: "USERNAME",
            placeholder: "Demo",
            isPassword: false,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SlideAnimation(
          position: 3,
          itemCount: 8,
          slideDirection: SlideDirection.fromRight,
          animationController: _animationController,
          //child: buildTextField("EMAIL ADDRESS", "test123@demo.com", false),
          child: const BuildTextField(
            labelText: "EMAIL ADDRESS",
            placeholder: "test123@demo.com",
            isPassword: false,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SlideAnimation(
          position: 4,
          itemCount: 8,
          slideDirection: SlideDirection.fromLeft,
          animationController: _animationController,
          // child: buildTextField("PASSWORD", "*******", true),
          child: const BuildTextField(
            labelText: "PASSWORD",
            placeholder: "*******",
            isPassword: true,
          ),
        ),
        SlideAnimation(
          position: 5,
          itemCount: 8,
          slideDirection: SlideDirection.fromBottom,
          animationController: _animationController,
          child: Row(
            children: [
              Radio(
                  toggleable: true,
                  value: "demo",
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    groupValue = val;
                    setState(() {});
                  }),
              Text(
                "I agree with",
                style: TextStyle(fontSize: 13, fontFamily: "Futura"),
              ),
              Text(
                " Private Policy",
                style: TextStyle(
                    fontSize: 12,
                    color: ColorsRes.newAppColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Futura"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
