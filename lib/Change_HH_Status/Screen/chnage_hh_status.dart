import 'package:flutter/material.dart';
import 'package:helioz/common/Drawer/widgets/drawer.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:helioz/common/widgets/text_style.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ChangeHHStatusScreen extends StatefulWidget {
  const ChangeHHStatusScreen({Key? key}) : super(key: key);

  @override
  _ChangeHHStatusScreenState createState() => _ChangeHHStatusScreenState();
}

class _ChangeHHStatusScreenState extends State<ChangeHHStatusScreen> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  TextEditingController dropPutdateController = TextEditingController();
  DateTime _date = DateTime.now();
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  String? resonForDropPutValue;
  var ResonForDropOut = ['a', "b", "c"];

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
      dropPutdateController.text = dateFormat.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      appBar: AppBar(
        title: Text(
          "Change of household status ",
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
          SizedBox(
            height: 8.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Date of drop-put:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: dropPutdateController,
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
                hintText: 'Select Date of drop-put',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Select Date of drop-put';
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
              "Reason for household drop-out:",
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
                hint: const Text("Select Reason for household drop-out:"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down,
                        color: ColorsRes.buttoncolor)),
                items: ResonForDropOut.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: resonForDropPutValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      resonForDropPutValue = valueSelected as String?;
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
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Address:",
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
                hintText: 'Enter Address:',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Address:';
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
              "Phone Number:",
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
                hintText: 'Enter Phone Number',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Phone Number';
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
              "Number of Household Members:",
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
                hintText: 'Enter Number of Household Members:',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Number of Household Members:';
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
              "ANumber of Households Members with Disability:",
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
                hintText: 'Enter Number of Households Members with Disability:',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Number of Households Members with Disability:';
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
