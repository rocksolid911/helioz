import 'package:flutter/material.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:helioz/common/widgets/text_style.dart';
import 'package:helioz/Listing/Widget/house_Hold_Widget.dart';
import 'package:helioz/common/Drawer/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ReplaceEquipmentScreen extends StatefulWidget {
  const ReplaceEquipmentScreen({Key? key}) : super(key: key);

  @override
  _ReplaceEquipmentScreenState createState() => _ReplaceEquipmentScreenState();
}

class _ReplaceEquipmentScreenState extends State<ReplaceEquipmentScreen> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  TextEditingController replacedateController = TextEditingController();
  DateTime _date = DateTime.now();
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  _handerlDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      replacedateController.text = dateFormat.format(date);
    }
  }

  var reasonForReplace = ["A", "b", 'c'];
  String? reasonForReplaceValue;
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      appBar: AppBar(
        title: Text(
          "Household Details ",
          style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5B81E8)),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF5B81E8)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          const Icon(Icons.reply),
          SizedBox(
            width: 7.w,
          ),
        ],
      ),
      drawer: const myDrawer(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.h),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text("Name: Kedar Dash",
                    textAlign: TextAlign.start, style: houseHoldDetailsStyle),
                const SizedBox(
                  height: 5,
                ),
                Text("Village: Tal",
                    textAlign: TextAlign.start, style: houseHoldDetailsStyle),
                const SizedBox(
                  height: 5,
                ),
                Text("Post Office: Diptipur, District: Bargarh, Odisha",
                    textAlign: TextAlign.start, style: houseHoldDetailsStyle),
                const SizedBox(
                  height: 30,
                ),
                Text("Technology Given On: November 15, 2021",
                    textAlign: TextAlign.start,
                    style: houseHoldDetailsStyleTwo),
                const SizedBox(
                  height: 5,
                ),
                Text("Monitored on : December 12, 2021",
                    textAlign: TextAlign.start,
                    style: houseHoldDetailsStyleTwo),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            child: const Divider(
              thickness: 1.5,
              color: ColorsRes.buttoncolor,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Center(
            child: Text(
              "Replacement of equipment",
              style: TextStyle(
                  color: ColorsRes.buttoncolor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
            child: CheckboxListTile(
              activeColor: ColorsRes.buttoncolor,
              title: Text(
                "Replacement of equipment (bottles/containers) required",
                style: TextStyle(
                  fontSize: 12.5.sp,
                ),
              ),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue!;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.trailing, //  <-- leading Checkbox
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Quantity of equipment (bottles/containers) to be replaced:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText:
                    'Enter Quantity of equipment (bottles/containers) to be replaced',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Quantity of equipment (bottles/containers) to be replaced';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Reason for replacement:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text("Select Reason for replacement:"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down,
                        color: ColorsRes.buttoncolor)),
                items: reasonForReplace.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: reasonForReplaceValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      reasonForReplaceValue = valueSelected as String?;
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Select Reason for replacement';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Date of distribution/Sale:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: replacedateController,
              onTap: _handerlDatePicker,
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: ColorsRes.buttoncolor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText: 'Enter Date of replacement',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Date of replacement';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Number of replaced equipment (bottles/containers):",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText:
                    'Enter Number of replaced equipment (bottles/containers)',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Number of replaced equipment (bottles/containers)';
                }
                return null;
              },
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
                // border: Border.all(),
                color: ColorsRes.buttoncolor,
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
