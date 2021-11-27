import 'package:flutter/material.dart';
import 'package:helioz/Home/mainmenu/screens/mainmenu.dart';
import 'package:helioz/common/AppBar/my_appBar.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:helioz/common/widgets/text_style.dart';
import 'package:sizer/sizer.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({Key? key}) : super(key: key);

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      drawer: const MainMenu(),
      appBar: CustomAppBar("Preference"),
      body: ListView(
        children: [
          SizedBox(
            height: 8.h,
          ),
          Container(
            height: 12.h,
            child: Image.asset("assets/helioz-menu-icons/preference.png"),
          ),
          SizedBox(
            height: 4.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 8.h,
            decoration: const BoxDecoration(
              // border: Border.all(),
              color: ColorsRes.newAppColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            child: const Center(
              child: Text(
                "Change Password",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 8.h,
            decoration: const BoxDecoration(
              // border: Border.all(),
              color: ColorsRes.newAppColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            child: const Center(
              child: Text(
                "Change Mobile Number (OTP required)",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  // fillColor: const Color(0xff5b81e8),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  // labelText: 'Full Name',
                  hintText: 'Enter OTP',
                  hintStyle: TextStyle(color: Colors.black38)),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter OTP';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 6.w, top: 1.h),
            alignment: Alignment.centerRight,
            child: Text(
              "Resend OTP",
              style: heading,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              height: 6.h,
              width: 20.h,
              // alignment: Alignment.bottomRight,
              decoration: const BoxDecoration(
                color: ColorsRes.newAppColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Center(
                  child: Text(
                "Submit",
                style: buttonTextStyle,
              )),
            ),
          ),
          SizedBox(
            height: 2.h,
          )
        ],
      ),
    );
  }
}
