import 'package:flutter/material.dart';
import 'package:helioz/Home/mainmenu/screens/mainmenu.dart';
import 'package:helioz/common/AppBar/myappbar.dart';

import 'package:helioz/common/colorsres.dart';
import 'package:helioz/common/widgets/text_style.dart';
import 'package:helioz/Listing/Widget/householdwidget.dart';
import 'package:helioz/common/Drawer/widgets/drawer.dart';
import 'package:sizer/sizer.dart';

class ListHouseHoldScreen extends StatefulWidget {
  const ListHouseHoldScreen({Key? key}) : super(key: key);

  @override
  _ListHouseHoldScreenState createState() => _ListHouseHoldScreenState();
}

class _ListHouseHoldScreenState extends State<ListHouseHoldScreen> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerkey,
        drawer: const MainMenu(),
        appBar: CustomAppBar("Listing Household"),
        body: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    // height: 7.h,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      // validator: validateEmail(TexEd),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        // labelText: 'Full Name',
                        hintText: 'Enter Full Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Full Name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 7.h,
                    // width: 15.h,
                    // alignment: Alignment.bottomRight,
                    decoration: const BoxDecoration(
                      color: ColorsRes.buttoncolor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "Search",
                      style: buttonTextStyle,
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.h),
              child: const Divider(
                thickness: 2,
                color: ColorsRes.buttoncolor,
              ),
            ),
            HouseHoldContainer(context),
            HouseHoldContainer(context),
            HouseHoldContainer(context),
            HouseHoldContainer(context),
          ],
        ),
      ),
    );
  }
}
