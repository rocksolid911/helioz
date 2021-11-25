import 'package:flutter/material.dart';
import 'package:helioz/common/widgets/text_style.dart';
import 'package:helioz/Home/Pre_registration/Data/pre_reg_data.dart';
import 'package:helioz/common/Drawer/widgets/drawer.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:sizer/sizer.dart';

class PreRegistrationScreen extends StatefulWidget {
  const PreRegistrationScreen({Key? key}) : super(key: key);

  @override
  _PreRegistrationScreenState createState() => _PreRegistrationScreenState();
}

class _PreRegistrationScreenState extends State<PreRegistrationScreen> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  String? genderItem = "";
  String? waterTreatmentRadioDry = "";
  String? waterTreatmentRadioRainy = "";

  String? mainFuelSourceValue;
  String? mainWaterSourceDryValue;
  String? mainWaterSourceRainyValue;
  String? treatmentWaterSourceRainyValue;
  String? treatmentWaterSourceDryValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      appBar: AppBar(
        title: Text(
          "Pre-Registration",
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
      body: Scrollbar(
        child: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Name of beneficiary:",
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
                  hintText: 'Name of beneficiary',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Name of beneficiary';
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
                "Gender:",
                style: heading,
              ),
            ),
            SizedBox(
              height: .5.h,
            ),
            SizedBox(
              height: 5.h,
              // margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile(
                      groupValue: genderItem,
                      title: const Text('Male'),
                      value: 'Male',
                      onChanged: (val) {
                        setState(() {
                          genderItem = val as String;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      groupValue: genderItem,
                      title: const Text('Female'),
                      value: 'Female',
                      onChanged: (val) {
                        setState(() {
                          genderItem = val as String;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
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
                  hintText: 'Enter Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Address';
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
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Main fuel source in use:",
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
                  hint: const Text("Select Main fuel source in use"),
                  isExpanded: true,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: ColorsRes.buttoncolor,
                      )),
                  items: mainFuelSource.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  value: mainFuelSourceValue,
                  onChanged: (valueSelected) {
                    setState(
                      () {
                        mainFuelSourceValue = valueSelected as String?;

                        // debugPrint('User selected $mainFuelSourceValue');
                      },
                    );
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select Main fuel source in use';
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
                "Main water source in use - Dry season:",
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
                  hint: const Text(
                      "Select Main water source in use - Dry season"),
                  isExpanded: true,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: ColorsRes.buttoncolor,
                      )),
                  items: waterSourceDry.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  value: mainWaterSourceDryValue,
                  onChanged: (valueSelected) {
                    setState(
                      () {
                        mainWaterSourceDryValue = valueSelected as String?;

                        // debugPrint('User selected $CountryValue');
                      },
                    );
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select Main water source in use - Dry season';
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
                "Main water source in use - Rainy season:",
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
                  hint: const Text(
                      "Select Main water source in use - Rainy season"),
                  isExpanded: true,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: ColorsRes.buttoncolor,
                      )),
                  items: waterSourceRainy.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  value: mainWaterSourceRainyValue,
                  onChanged: (valueSelected) {
                    setState(
                      () {
                        mainWaterSourceRainyValue = valueSelected as String?;

                        // debugPrint('User selected $CountryValue');
                      },
                    );
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select Main water source in use - Rainy season;';
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
                "water treatment method in use - Dry season:",
                style: heading,
              ),
            ),
            SizedBox(
              height: 5.h,
              // margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile(
                      groupValue: waterTreatmentRadioDry,
                      title: const Text('Yes'),
                      value: 'Yes',
                      onChanged: (val) {
                        setState(() {
                          waterTreatmentRadioDry = val as String;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      groupValue: waterTreatmentRadioDry,
                      title: const Text('No'),
                      value: 'No',
                      onChanged: (val) {
                        setState(() {
                          waterTreatmentRadioDry = val as String;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "IF YES, water treatment method in use. Main type of water Treatment method in use - Dry Season:",
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
                  hint: const Text("Select water treatment method "),
                  isExpanded: true,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: ColorsRes.buttoncolor,
                      )),
                  items: waterTreatmentDry.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  value: treatmentWaterSourceDryValue,
                  onChanged: (valueSelected) {
                    setState(
                      () {
                        treatmentWaterSourceDryValue = valueSelected as String?;

                        // debugPrint('User selected $treatmentWaterSourceDryValue');
                      },
                    );
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select water treatment method ';
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
                "water treatment method in use - Rainy season:",
                style: heading,
              ),
            ),
            SizedBox(
              height: 5.h,
              // margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile(
                      groupValue: waterTreatmentRadioRainy,
                      title: const Text('Yes'),
                      value: 'Yes',
                      onChanged: (val) {
                        setState(() {
                          waterTreatmentRadioRainy = val as String;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      groupValue: waterTreatmentRadioRainy,
                      title: const Text('No'),
                      value: 'No',
                      onChanged: (val) {
                        setState(() {
                          waterTreatmentRadioRainy = val as String;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "IF YES, water treatment method in use. Main Type of water Treatment method in use - Rainy Season",
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
                  hint: const Text("Select Water Treatment method"),
                  isExpanded: true,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: ColorsRes.buttoncolor,
                      )),
                  items: waterTreatmentRainy.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  value: treatmentWaterSourceRainyValue,
                  onChanged: (valueSelected) {
                    setState(
                      () {
                        treatmentWaterSourceRainyValue =
                            valueSelected as String?;

                        // debugPrint('User selected $CountryValue');
                      },
                    );
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select Your Country';
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
                "Requested type of Project technolology:",
                style: heading,
              ),
            ),
            SizedBox(
              height: 5.h,
              // margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile(
                      groupValue: genderItem,
                      title: const Text('WADI'),
                      value: 'WADI',
                      onChanged: (val) {
                        setState(() {
                          genderItem = val as String;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      groupValue: genderItem,
                      title: const Text('Other'),
                      value: 'Other',
                      onChanged: (val) {
                        setState(() {
                          genderItem = val as String;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Requested number of project technogy:",
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
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  // labelText: 'Full Name',
                  hintText: 'Requested number of project technogy',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Requested number of project technogy';
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
      ),
    );
  }
}
