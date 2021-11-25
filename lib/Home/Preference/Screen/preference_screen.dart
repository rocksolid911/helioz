import 'package:flutter/material.dart';
import 'package:helioz/common/widgets/text_style.dart';
import 'package:sizer/sizer.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({Key? key}) : super(key: key);

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          const Icon(Icons.share),
          SizedBox(
            width: 7.w,
          ),
        ],
      ),
      drawer: const Drawer(),
      body: ListView(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: Text(
              "Preference",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 8.h,
            decoration: BoxDecoration(
              border: Border.all(),
              color: const Color(0xff5b81e8),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: const Center(
              child: Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 8.h,
            decoration: BoxDecoration(
              border: Border.all(),
              color: const Color(0xff5b81e8),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: const Center(
              child: Text(
                "Change Mobile Number (OTP required)",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
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
                    borderRadius: BorderRadius.circular(15.0),
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
              width: 15.h,
              // alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                border: Border.all(),
                color: const Color(0xff5b81e8),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: const Center(
                  child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
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
