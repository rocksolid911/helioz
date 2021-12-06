import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helioz/Home/mainmenu/screens/mainmenu.dart';
import 'package:helioz/common/AppBar/myappbar.dart';
import 'package:helioz/common/Drawer/widgets/drawer.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:helioz/common/widgets/text_style.dart';
import 'package:sizer/sizer.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerkey,
        appBar: CustomAppBar("Help"),

        drawer: const MainMenu(),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 17.0, top: 10.0, right: 17.0),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: ListView(children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: ColorsRes.newAppColor,
                  // border: Border.all(),
                ),
                child: Center(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/helioz-menu-icons/help.png",
                        ),
                        const Text(
                          "Frequently Asked Questions ?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 7.w),
                child: const Text(
                  "How to Register ?",
                  style: TextStyle(fontSize: 18, color: ColorsRes.buttoncolor),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 4.w, right: 2.w),
                child: const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.star,
                    color: ColorsRes.buttoncolor,
                  ),
                  title: Text(
                      "Click on Pre-Registration in Main Menu Page and fill all the required details."),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 4.w, right: 2.w),
                child: const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.star,
                    color: ColorsRes.buttoncolor,
                  ),
                  title: Text("After that click on Submit Botton."),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: const Divider(
                  thickness: 2,
                  color: Colors.black38,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 7.w),
                child: const Text(
                  "How to Change Password ?",
                  style: TextStyle(fontSize: 18, color: ColorsRes.buttoncolor),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 4.w, right: 2.w),
                child: const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.star,
                    color: ColorsRes.buttoncolor,
                  ),
                  title: Text(
                      "Click on Preference in Main Menu Pageand enter us Valid Mobile Number. "),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 4.w, right: 2.w),
                child: const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.star,
                    color: ColorsRes.buttoncolor,
                  ),
                  title: Text("Enter the Valid OTP."),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: const Divider(
                  thickness: 2,
                  color: Colors.black38,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 8.w),
                child: const Text(
                  "For more information",
                  style: TextStyle(fontSize: 18, color: ColorsRes.buttoncolor),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 7.w, right: 2.w),
                child: const Text(
                  "Contact Us at: ",
                  style: TextStyle(
                      color: ColorsRes.buttoncolor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 4.w, right: 2.w),
                child: const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.email,
                    color: ColorsRes.buttoncolor,
                  ),
                  title: Text("Email : abc@gmail.com."),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 4.w, right: 2.w),
                child: const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.phone,
                    color: ColorsRes.buttoncolor,
                  ),
                  title: Text("Toll Free No. 11110000"),
                ),
              ),
            ]),
          ),
        ));
  }
}
