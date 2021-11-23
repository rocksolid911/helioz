import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helioz/Auth/Login/Screen/signupscreen.dart';
import 'package:helioz/Auth/Login/widgets/buildtextfield.dart';
import 'package:helioz/common/widgets/slideanimation.dart';

String? groupValue = '';

class WRLogin1 extends StatefulWidget {
  const WRLogin1({Key? key}) : super(key: key);

  @override
  _WRLogin1State createState() => _WRLogin1State();
}

class _WRLogin1State extends State<WRLogin1>
    with SingleTickerProviderStateMixin {
  final blueColor = const Color(0XFF5e92f3);
  final yellowColor = const Color(0XFFfdd835);

  TapGestureRecognizer? _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (BuildContext context) => WRSingup1()));
        Navigator.pushReplacementNamed(context, "/signup");
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 8),
                          height: MediaQuery.of(context).size.width / 1.4,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                "assets/images/shape.svg",
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
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width /
                                          3.8,
                                    ),
                                    const SizedBox(height: 10.0),
                                    // const Text(
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
                              const SizedBox(height: 20.0),
                              SlideAnimation(
                                position: 1,
                                itemCount: 8,
                                slideDirection: SlideDirection.fromLeft,
                                animationController: _animationController,
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Color(0xFF5B81E8),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              SingleChildScrollView(
                                child: buildSignInTextFieldSection(),
                              ),
                              buildSingInBottomSection(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Container buildSingInBottomSection() {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            width: 5,
          ),
          SlideAnimation(
            position: 6,
            itemCount: 8,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                primary: const Color(0xFF5B81E8),
                elevation: 1.0,
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/dashboard");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SlideAnimation(
            position: 7,
            itemCount: 8,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: RichText(
              text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: "Sign Up",
                        recognizer: _tapGestureRecognizer,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF5B81E8),
                          fontWeight: FontWeight.bold,
                        ))
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

  Column buildSignInTextFieldSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: SlideAnimation(
            position: 2,
            itemCount: 8,
            slideDirection: SlideDirection.fromLeft,
            animationController: _animationController,
            child:
                // buildTextField("EMAIL ADDRESS", "test123@demo.com", false),
                const BuildTextField(
              labelText: "EMAIL ADDRESS",
              placeholder: "test123@demo.com",
              isPassword: false,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: SlideAnimation(
            position: 3,
            itemCount: 8,
            slideDirection: SlideDirection.fromRight,
            animationController: _animationController,
            child: const BuildTextField(
              labelText: "PASSWORD",
              placeholder: "please enter your password",
              isPassword: true,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SlideAnimation(
              position: 4,
              itemCount: 8,
              slideDirection: SlideDirection.fromLeft,
              animationController: _animationController,
              child: Row(
                children: [
                  Radio(
                      toggleable: true,
                      activeColor: const Color(0xFF5B81E8),
                      value: "demo",
                      groupValue: groupValue,
                      onChanged: (dynamic val) {
                        groupValue = val;
                        setState(() {});
                      }),
                  Text(
                    "Remember me",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            SlideAnimation(
                position: 5,
                itemCount: 8,
                slideDirection: SlideDirection.fromRight,
                animationController: _animationController,
                child: Text("Forgot your password?",
                    style: TextStyle(fontSize: 12)))
          ],
        )
      ],
    );
  }
}
