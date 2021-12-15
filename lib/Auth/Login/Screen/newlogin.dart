import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helioz/Auth/Login/Screen/signupscreen.dart';
import 'package:helioz/Auth/Login/widgets/buildtextfield.dart';
import 'package:helioz/common/Validation/signinvalidation.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:helioz/common/widgets/slideanimation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:form_field_validator/form_field_validator.dart';

String? groupValue = '';

class WRLogin2 extends StatefulWidget {
  const WRLogin2({Key? key}) : super(key: key);

  @override
  _WRLogin2State createState() => _WRLogin2State();
}

class _WRLogin2State extends State<WRLogin2>
    with SingleTickerProviderStateMixin {
  final blueColor = const Color(0XFF5e92f3);
  final yellowColor = const Color(0XFFfdd835);

  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
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
  TextEditingController userIdConttroller = TextEditingController();
  TextEditingController passwordConttroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignInValidation>(context);
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
                                color: ColorsRes.newAppColor,
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
                                      width: MediaQuery.of(context).size.width /
                                          3.8,
                                    ),
                                    const SizedBox(height: 10.0),
                                    Center(
                                      child: Text(
                                        "Monitoring of Carbon Credit Project",
                                        style: TextStyle(
                                            color: ColorsRes.logoColor,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Futura"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
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
                                      color: ColorsRes.newAppColor,
                                      fontSize: 19,
                                      fontFamily: "Futura",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              SingleChildScrollView(
                                child: buildSignInTextFieldSection(),
                                //child: Form(child: null,),
                              ),
                              // buildSingInBottomSection(),
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

  Form buildSignInTextFieldSection() {
    final validationService = Provider.of<SignInValidation>(context);
    return Form(
      autovalidate: true,
      key: loginformkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: SlideAnimation(
              position: 2,
              itemCount: 8,
              slideDirection: SlideDirection.fromLeft,
              animationController: _animationController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                  TextFormField(
                    controller: userIdConttroller,
                    onChanged: (value) {
                      validationService.ceckEmail(value);
                    },

                    // obscuringCharacter: "*",
                    //style: const TextStyle(color: Color(0xFF5B81E8)),
                    //obscureText: widget.isPassword == true ? _obscureText : false,
                    decoration: InputDecoration(
                      hintText: "email",
                      // errorText: "Please enter a valid email",
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF5B81E8)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),

                      //: Container(),
                    ),
                    // validator: (value) {
                    //   RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    //   if (regex.hasMatch(value!) || value.isEmpty) {
                    //     return 'Enter a valid email address';
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    validator: EmailValidator(
                        errorText: 'enter a valid email address'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: SlideAnimation(
              position: 3,
              itemCount: 8,
              slideDirection: SlideDirection.fromRight,
              animationController: _animationController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                  TextFormField(
                    controller: passwordConttroller,
                    // onChanged: (value) {
                    //   validationService.ceckEmail(value);
                    // },
                    decoration: InputDecoration(
                      hintText: "pass",
                      errorText: validationService.email.error,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF5B81E8)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),

                      //: Container(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
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
                      style: TextStyle(
                          fontSize: 9.sp,
                          fontFamily: "Futura",
                          fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontSize: 9.sp, fontFamily: "Futura")))
            ],
          ),
          Column(
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
                    primary: ColorsRes.newAppColor,
                    elevation: 1.0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 12),
                  ),
                  onPressed: () {
                    if (loginformkey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Futura"),
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
                      style: const TextStyle(
                          color: Colors.black, fontFamily: "Futura"),
                      children: [
                        TextSpan(
                            text: "Sign Up",
                            recognizer: _tapGestureRecognizer,
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: ColorsRes.newAppColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Futura"))
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  loginUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString("userId", userIdConttroller.text);
    print(userIdConttroller.text);

    Navigator.pushReplacementNamed(context, "/dashboard");
  }
}
