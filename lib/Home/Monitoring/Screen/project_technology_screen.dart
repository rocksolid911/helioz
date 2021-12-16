import 'package:flutter/material.dart';
import 'package:helioz/Home/Monitoring/Data/project_tech_data.dart';
import 'package:helioz/Home/mainmenu/screens/mainmenu.dart';
import 'package:helioz/LocalDataBase/DatabaseHelper/db_helper.dart';
import 'package:helioz/LocalDataBase/Model/project_tech_model.dart';
import 'package:helioz/Pre_registration/Data/pre_reg_data.dart';
import 'package:helioz/common/AppBar/myappbar.dart';
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

  // controller
  TextEditingController averageLiterWaterPerDayController =
      TextEditingController();
  TextEditingController averageLiterWaterPerDayPersonController =
      TextEditingController();
  TextEditingController grievancesProjectController = TextEditingController();
  TextEditingController grievancesProjectTechController =
      TextEditingController();

  //Radio
  String? projectTechItem = "";
  String? waterTreatedProjectTechItem = "";
  String? waterUnTreatedWaterItem = "";
  String? waterTreatmentRadioDry = "";
  String? waterTreatmentRadioRainy = "";

  //dropDownValues
  String? conOfProjectTechnologyValue;
  String? demonstrationOfTechnologyUseValue;
  String? avgNumDaysValue;
  String? reasonForNotDailyUseValue;
  String? typeOfTreatmentMethodValue;
  String? boilDrinkingWaterValue;
  String? boilDrinkingWaterTreatmentValue;
  String? availabilitySafeDrinkingWaterValue;
  String? reductionWaterDiseaseValue;
  String? reductionSickDayValue;
  String? reductionMedicalCostValue;
  String? reductionBoilingDrinkingWaterValue;
  String? reductionTImeSpendFirewoodValue;
  String? reduceWaterDisease;
  String? howLongStoreTreatedWaterValue;
  String? likeProjectTechValue;
  String? likeProjectActivity;

  //localDataBase
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    // TODO: implement initState
    databaseHelper = DatabaseHelper();
    databaseHelper.initDB();
    getData();
    super.initState();
  }
  List<ProjectTechModel> detsils = [];
  getData() async {
    detsils = await databaseHelper.getProjectTechData();
    print(detsils.map((e) => e.id));
  }

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
                value: conOfProjectTechnologyValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      conOfProjectTechnologyValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
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
                    groupValue: projectTechItem,
                    title: const Text('Yes'),
                    value: 'Yes',
                    onChanged: (val) {
                      setState(() {
                        projectTechItem = val as String;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    groupValue: projectTechItem,
                    title: const Text('No'),
                    value: 'No',
                    onChanged: (val) {
                      setState(() {
                        projectTechItem = val as String;
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
                hint: const Text("Select Demonstration of Technology Use."),
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
                value: demonstrationOfTechnologyUseValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      demonstrationOfTechnologyUseValue =
                          valueSelected as String?;

                      // debugPrint('User selected $CountryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Demonstration of Technology Use';
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
                hint: const Text(
                    "Select Average number of technology is used per week."),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: ColorsRes.buttoncolor,
                    )),
                items: Avg_num_days.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: avgNumDaysValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      avgNumDaysValue = valueSelected as String?;

                      // debugPrint('User selected $CountryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Average number of technology is used per week';
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
              "If lower than 5 Reason for not daily use:",
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
                hint: const Text("IF lower than 5 Reason for not daily use"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: ColorsRes.buttoncolor,
                    )),
                items:
                    Reason_for_not_daily_use.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: reasonForNotDailyUseValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      reasonForNotDailyUseValue = valueSelected as String?;

                      // debugPrint('User selected $mainFuelSourceValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select IF lower than 5 Reason for not daily use';
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
                items:
                    Type_of_treatment_method.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: typeOfTreatmentMethodValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      typeOfTreatmentMethodValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Type of treatment method';
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
              controller: averageLiterWaterPerDayController,
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText:
                    'Enter Average liters of water treated with project technology per day',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Average liters of water treated with project technology per day';
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
              "Average liters of water  Per Person per day:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: averageLiterWaterPerDayPersonController,
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText: 'Enter liters of water Per Person per day:',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Average liters of water Per Person per day';
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
              "Do you boil drinking water after treatment with the Project Technology?",
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
                hint: const Text("Do you boil drinking water after treatment."),
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
                value: boilDrinkingWaterValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      boilDrinkingWaterValue = valueSelected as String?;

                      // debugPrint('User selected $CountryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select';
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
              "Do you Boil drinking water in addition to use of the Project Technology?",
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
                hint: const Text("Do you boil drinking water after treatment."),
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
                value: boilDrinkingWaterTreatmentValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      boilDrinkingWaterTreatmentValue =
                          valueSelected as String?;

                      // debugPrint('User selected $CountryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select';
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
                value: availabilitySafeDrinkingWaterValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      availabilitySafeDrinkingWaterValue =
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
                items: Influence_of_Project_Technology_on.map(
                    (String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: reductionWaterDiseaseValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      reductionWaterDiseaseValue = valueSelected as String?;

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
                items: Influence_of_Project_Technology_on.map(
                    (String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: reductionSickDayValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      reductionSickDayValue = valueSelected as String?;

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
                items: Influence_of_Project_Technology_on.map(
                    (String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: reductionMedicalCostValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      reductionMedicalCostValue = valueSelected as String?;

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
                items: Influence_of_Project_Technology_on.map(
                    (String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: reductionBoilingDrinkingWaterValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      reductionBoilingDrinkingWaterValue =
                          valueSelected as String?;

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
                items: Influence_of_Project_Technology_on.map(
                    (String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: reductionTImeSpendFirewoodValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      reductionTImeSpendFirewoodValue =
                          valueSelected as String?;
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
                    groupValue: waterTreatedProjectTechItem,
                    title: const Text('Yes'),
                    value: 'Yes',
                    onChanged: (val) {
                      setState(() {
                        waterTreatedProjectTechItem = val as String;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    groupValue: waterTreatedProjectTechItem,
                    title: const Text('No'),
                    value: 'No',
                    onChanged: (val) {
                      setState(() {
                        waterTreatedProjectTechItem = val as String;
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
              "How long do you store the treated water?:",
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
                items: How_long_store_treated_water.map(
                    (String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: howLongStoreTreatedWaterValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      howLongStoreTreatedWaterValue = valueSelected as String?;
                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Select How long do you store the water?';
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
                    groupValue: waterUnTreatedWaterItem,
                    title: const Text('Yes'),
                    value: 'Yes',
                    onChanged: (val) {
                      setState(() {
                        waterUnTreatedWaterItem = val as String;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    groupValue: waterUnTreatedWaterItem,
                    title: const Text('No'),
                    value: 'No',
                    onChanged: (val) {
                      setState(() {
                        waterUnTreatedWaterItem = val as String;
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
                hint: const Text("Select Do you like the Project Technology"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: ColorsRes.buttoncolor,
                    )),
                items: like_Project_Technology.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: likeProjectTechValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      likeProjectTechValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Select Do you like the Project Technology';
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
              "Do you like the Project Activities?",
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
                hint: const Text("Select Do you like the Project Activities"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: ColorsRes.buttoncolor,
                    )),
                items: like_Project_Technology.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: likeProjectActivity,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      likeProjectActivity = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Select Do you like the Project Activities';
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
              "Do you have any grievances regarding the Project Technology?",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: grievancesProjectTechController,
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText:
                    'Enter any grievances regarding the Project Technology:',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter any grievances regarding the Project Technology';
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
              "Do you have any grievances regarding the Project ?",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: grievancesProjectController,
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText: 'Enter any grievances regarding the Project:',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter any grievances regarding the Project';
                }
                return null;
              },
            ),
          ),
          InkWell(
            child: Align(
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
                  ),
                ),
              ),
            ),
            onTap: () {
              insertProjectTechData();
            },
          ),
          SizedBox(
            height: 2.h,
          )
        ],
      ),
    );
  }

  insertProjectTechData() {
    ProjectTechModel projectTechModel = ProjectTechModel(
        conditionOfProject: conOfProjectTechnologyValue.toString(),
        projectTechUseVisit: projectTechItem.toString(),
        demonstrationProject: demonstrationOfTechnologyUseValue.toString(),
        averageNumTechWeek: avgNumDaysValue.toString(),
        reasonOfNotUse: reasonForNotDailyUseValue.toString(),
        typeOfTreatMethod: typeOfTreatmentMethodValue.toString(),
        averageWaterTreatedPerDay:
            averageLiterWaterPerDayController.text.toString(),
        averageWaterTreatedPerDayPerson:
            averageLiterWaterPerDayPersonController.text.toString(),
        boilDrinkingWater: boilDrinkingWaterTreatmentValue.toString(),
        boilDrinkingWaterAddition: boilDrinkingWaterTreatmentValue.toString(),
        availabilityDrinkingWater:
            availabilitySafeDrinkingWaterValue.toString(),
        reductionOfWaterBorne: reductionWaterDiseaseValue.toString(),
        reductionOfSickDay: reductionSickDayValue.toString(),
        reductionOfMedicalCost: reductionMedicalCostValue.toString(),
        reductionOfBoilingDrinkingWater:
            reductionBoilingDrinkingWaterValue.toString(),
        reductionSpendTimeFirewood: reductionTImeSpendFirewoodValue.toString(),
        storeWaterProjectTech: waterTreatedProjectTechItem.toString(),
        howLongStoreWater: howLongStoreTreatedWaterValue.toString(),
        untreatedWaterHealth: waterUnTreatedWaterItem.toString(),
        likeProjectTech: likeProjectTechValue.toString(),
        likeProjectActivity: likeProjectActivity.toString(),
        grievanceProjectTech: grievancesProjectTechController.toString(),
        grievanceProjectActivity: grievancesProjectController.toString());
    databaseHelper.insertProjectTech(projectTechModel);
    print(projectTechModel.toMap().toString());
  }
}
