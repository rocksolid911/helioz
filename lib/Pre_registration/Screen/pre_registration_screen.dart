import 'package:flutter/material.dart';
import 'package:helioz/Home/mainmenu/screens/mainmenu.dart';
import 'package:helioz/Pre_registration/Data/pre_reg_data.dart';

import 'package:helioz/Registration/Widget/formtitle.dart';
import 'package:helioz/common/AppBar/myappbar.dart';
import 'package:helioz/common/Validation/preregvalidation.dart';
import 'package:helioz/common/widgets/text_style.dart';

import 'package:helioz/common/colorsres.dart';
import 'package:provider/provider.dart';
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
  String? StateValue;
  String? DistrictValue;
  String? TehsilValue;
  String? BlockValue;
  String? PanchayatValue;
  String? VillageValue;
  String? mainFuelSourceValue;
  String? mainWaterSourceDryValue;
  String? mainWaterSourceRainyValue;
  String? treatmentWaterSourceRainyValue;
  String? treatmentWaterSourceDryValue;
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<PreRegValidation>(context);
    return Scaffold(
      key: _drawerkey,
      appBar: CustomAppBar("Pre-Registration"),
      drawer: const MainMenu(),
      body: Scrollbar(
        child: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
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
                  errorText: validationService.firstName.error
                ),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Enter Name of beneficiary';
                //   }
                //   return null;
                // },
                onChanged: (value){
                  validationService.changeFirstName(value);
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
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
            FormTitle(formtitle: "State:"),
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
                  hint: const Text("Select State"),
                  isExpanded: true,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_drop_down,
                          color: ColorsRes.buttoncolor)),
                  items: state.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  value: StateValue,
                  onChanged: (valueSelected) {
                    setState(
                      () {
                        StateValue = valueSelected as String?;
                      },
                    );
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select Your State';
                    }

                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            FormTitle(formtitle: "District:"),
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
                  hint: const Text("Select District"),
                  isExpanded: true,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_drop_down,
                          color: ColorsRes.buttoncolor)),
                  items: district.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  value: DistrictValue,
                  onChanged: (valueSelected) {
                    setState(
                      () {
                        DistrictValue = valueSelected as String?;
                      },
                    );
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select Your District';
                    }

                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            FormTitle(formtitle: "Block:"),
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
                  hint: const Text("Select Block"),
                  isExpanded: true,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_drop_down,
                          color: ColorsRes.buttoncolor)),
                  items: block.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  value: BlockValue,
                  onChanged: (valueSelected) {
                    setState(
                      () {
                        BlockValue = valueSelected as String?;
                      },
                    );
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select Your Block';
                    }

                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            FormTitle(formtitle: "Village:"),
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
                  hint: const Text("Select Village"),
                  isExpanded: true,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_drop_down,
                          color: ColorsRes.buttoncolor)),
                  items: village.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  value: VillageValue,
                  onChanged: (valueSelected) {
                    setState(
                      () {
                        VillageValue = valueSelected as String?;
                      },
                    );
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select Your Village:';
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
                maxLength: 10,
                // validator: validateEmail(TexEd),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  // labelText: 'Full Name',
                  hintText: 'Enter Phone Number',
                  errorText: validationService.phno.error
                ),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Enter Phone Number';
                //   }
                //   return null;
                // },
                onChanged: (value){
                  validationService.checkPhoneNo(value);
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
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
              margin: const EdgeInsets.only(left: 20, right: 20),
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
              margin: const EdgeInsets.only(left: 20, right: 20),
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
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Water treatment method in use - Dry season:",
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
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Water treatment method in use - Rainy season:",
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
              margin: const EdgeInsets.only(left: 20, right: 20),
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
              margin: const EdgeInsets.only(left: 20, right: 20),
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
    // return  DrawerScaffold(
    //     percentage: 0.6,
    //     appBar: AppBarProps(backgroundColor: Color(0xFFf9f9f9),iconTheme: IconThemeData(
    //       color: Colors.black,
    //     ),brightness: Brightness.light,
    //         title: Text("Navigation Scaler", style: TextStyle(color: Colors.black)),
    //         actions: [IconButton(icon: Icon(Icons.add), onPressed: () {
    //           ScaffoldMessenger.of(context)
    //               .showSnackBar(SnackBar(content: Text('Add'),duration: Duration(microseconds: 100),));
    //         })]),
    //     menuView:  MenuView(
    //       menu: menu,
    //       animation: true,
    //       selectorColor: const Color(0xffFF7479),
    //       // color: Theme.of(context).primaryColor,
    //       selectedItemId: selectedMenuItemId,
    //       onMenuItemSelected: (String? itemId) {
    //         selectedMenuItemId = itemId!;
    //         if (itemId == 'dash') {
    //           // setState(() => _widget = Text("The Paddock"));
    //           Navigator.pushNamed(context, "/dashboard");
    //         } else if (itemId == 'prereg') {
    //           Navigator.pushNamed(context, "/prereg");
    //         } else if (itemId == 'reg') {
    //           Navigator.pushNamed(context, "/reg");
    //         } else {
    //           Navigator.pushNamed(context, "/list");
    //         }
    //       },
    //     ),
    //     contentView: Screen(
    //       contentBuilder: (context) => LayoutBuilder(
    //         builder: (context, constraint) => Container(),
    //       ),
    //       color: Colors.white,
    //     ));
  }
}
