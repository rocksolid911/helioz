import 'package:flutter/material.dart';
import 'package:helioz/Home/Monitoring/Data/project_tech_data.dart';
import 'package:helioz/Home/mainmenu/screens/mainmenu.dart';
import 'package:helioz/Pre_registration/Data/pre_reg_data.dart';
import 'package:helioz/common/AppBar/my_appBar.dart';
import 'package:helioz/common/colorsres.dart';

import 'package:helioz/common/widgets/text_style.dart';

import 'package:sizer/sizer.dart';

class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  _TechnologyScreenState createState() => _TechnologyScreenState();
}

class _TechnologyScreenState extends State<TechnologyScreen> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController telePhoneNoController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();
  //NoteDetailState(this.note, this.appBarTitle);

  String? genderItem = "";
  String? waterTreatmentRadioDry = "";
  String? waterTreatmentRadioRainy = "";

  String? Con_of_Project_Technology_Value;
  String? Reason_for_not_daily_use_Value;
  String? Demonstration_of_Technology_Use_Value;

  String? Type_of_treatment_method_Value;
  String? How_long_store_treated_water_Value;
  String? like_Project_Technology_Value;
  String? like_Project_Activities_Value;

  // get mainFuelSource => null;

  // get waterSourceDry => null;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: CustomAppBar("Project Technology"),
      drawer: const MainMenu(),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Condition of Project Technology:",
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
                hint: const Text("Select Condition of Project Technology"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: ColorsRes.buttoncolor,
                    )),
                items:
                    Con_of_Project_Technology.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: Con_of_Project_Technology_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      Con_of_Project_Technology_Value =
                          valueSelected as String?;

                      // debugPrint('User selected $mainFuelSourceValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Condition of Project Technology';
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
              "Project Technology in use during visit:",
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
                    title: const Text('Yes'),
                    value: 'Yes',
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
                    title: const Text('No'),
                    value: 'No',
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
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Demonstration of Technology Use.Were steps properly followed/explained by primary technology user:",
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
                hint: const Text("Select Demonstration of Technology Use"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: ColorsRes.buttoncolor,
                    )),
                items: Demonstration_of_Technology_Use.map(
                    (String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: Con_of_Project_Technology_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      Con_of_Project_Technology_Value =
                          valueSelected as String?;

                      // debugPrint('User selected $mainFuelSourceValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Demonstration of Technology Use';
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
              "Average number of technology is used per week:",
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
                hint:
                    const Text("Select Avg no. of technology is used per week"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: ColorsRes.buttoncolor,
                    )),
                items:
                    Con_of_Project_Technology.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: Con_of_Project_Technology_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      Con_of_Project_Technology_Value =
                          valueSelected as String?;

                      // debugPrint('User selected $mainFuelSourceValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Avg no. of technology is used per week';
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
              "IF lower than 5 Reason for not daily use:",
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
                hint:
                    const Text("Select Avg no. of technology is used per week"),
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
                value: Con_of_Project_Technology_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      Con_of_Project_Technology_Value =
                          valueSelected as String?;

                      // debugPrint('User selected $mainFuelSourceValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Avg no. of technology is used per week';
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
              "Type of treatment method:",
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
                hint: const Text("Select Type of treatment method"),
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
                value: Type_of_treatment_method_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      Type_of_treatment_method_Value = valueSelected as String?;

                      // debugPrint('User selected $CountryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Select Type of treatment method';
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
              "Average liters of water treated with project technology per day:",
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
                    'Select Average liters of water treated with project technology per day',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Select Average liters of water treated with project technology per day';
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
              "Average liters of water  Per Person per day::",
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
                hintText: 'Select Average liters of water Per Person per day:',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Select Average liters of water Per Person per day';
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
              "Do you Boil drinking water in addition to use of the Project",
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
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Availability of safe drinking water:",
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
                hint: const Text("Select Availability of safe drinking water"),
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
                value: How_long_store_treated_water_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      How_long_store_treated_water_Value =
                          valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Select Availability of safe drinking water ';
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
              "Reduction of waterborne diseases:",
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
                hint: const Text("Select Reduction of waterborne diseases"),
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
                value: Type_of_treatment_method_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      like_Project_Technology_Value = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of waterborne diseases ';
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
              "Reduction of sick day:",
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
                hint: const Text("Select Reduction of sick day"),
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
                value: like_Project_Technology_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      like_Project_Technology_Value = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of sick day ';
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
              "Reduction of medical costs:",
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
                hint: const Text("Select Reduction of medical costs"),
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
                value: like_Project_Activities_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      like_Project_Activities_Value = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of medical costs ';
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
              "Reduction of boiling drinking water:",
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
                hint: const Text("Select Reduction of boiling drinking water"),
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
                value: like_Project_Activities_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      like_Project_Activities_Value = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of boiling drinking water ';
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
              "Reduction of boiling firewood usage:",
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
                hint: const Text("Select Reduction of boiling firewood usage"),
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
                value: like_Project_Activities_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      like_Project_Activities_Value = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of boiling firewood usage ';
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
              "Reduction of time spent on collecting firewood:",
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
                    "Select Reduction of time spent on collecting firewood"),
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
                value: like_Project_Activities_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      like_Project_Activities_Value = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of time spent on collecting firewood';
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
              "Do you store water treated with the project technology?:",
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
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "How long do you store the trated water?",
              //"How long do you think that drinking untreated water is bad for your heath?",
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
                    "Select How long do you store the trated water?"),
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
                value: like_Project_Activities_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      like_Project_Activities_Value = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select How long do you store the trated water?';
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
              "How long do you think that drinking untreated water is bad for your heath?",
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
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Do you like the Project Technology?",
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
                hint: const Text("1to5"),
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
                value: How_long_store_treated_water_Value,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      How_long_store_treated_water_Value =
                          valueSelected as String?;

                      // debugPrint('User selected $CountryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return '1to5';
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
              "Do you like the Project Activities:",
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
                hintText: '1to5',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '1to5';
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
    );
  }
}
