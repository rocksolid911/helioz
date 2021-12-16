import 'dart:convert';
import 'dart:io';
//import 'package:helioz/Pre_registration/Data/pre_reg_data.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:helioz/Home/mainmenu/screens/mainmenu.dart';
import 'package:helioz/LocalDataBase/DatabaseHelper/db_helper.dart';
import 'package:helioz/LocalDataBase/Model/registration_model.dart';
import 'package:helioz/Registration/Data/drop_down_data.dart';

import 'package:helioz/Registration/Widget/formtitle.dart';
import 'package:helioz/common/AppBar/myappbar.dart';
import 'package:helioz/common/Validation/registrationvalidation.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import 'package:helioz/common/widgets/text_style.dart';
import 'package:helioz/common/Drawer/widgets/drawer.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

//final menuScreenKey = GlobalKey(debugLabel: 'MenuScreen');

enum Category { general, obc, sc, st }


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  static final RegExp nameRegExp =RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  var _registerFormKey = GlobalKey<FormState>();
  File? imageFile;
  late String _base64image;
  DateTime _date = DateTime.now();
  final DateFormat dateFormat = DateFormat("dd/MMM/yyyy");
  TextEditingController distributionDateController = TextEditingController();
  TextEditingController trainningDateController = TextEditingController();
  TextEditingController hh_unique_indetifyController = TextEditingController();
  TextEditingController name_of_beneficiary_controller =
      TextEditingController();
  TextEditingController number_hh_controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController numberDisabilityController = TextEditingController();
  TextEditingController quantityProjectTechController = TextEditingController();
  TextEditingController quantityEquipController = TextEditingController();
  TextEditingController serialNumberProjectController = TextEditingController();
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
      distributionDateController.text = dateFormat.format(date);
    }
  }

  _handerlDatePickerTraining() async {
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
      trainningDateController.text = dateFormat.format(date);
    }
  }

  List<UserRegisterModel> detsils = [];
  getinfo() async {
    detsils = await databaseHelper.getData();
  }

  late DatabaseHelper databaseHelper;
  String? CountryValue;
  String? StateValue;
  String? DistrictValue;
  String? TehsilValue;
  String? BlockValue;
  String? PanchayatValue;
  String? VillageValue;
  String? EducationValue;
  String? OccupationValue;
  String? migrationValue;
  String? distributionValue;
  String? modelProjectTechnologyValue;
  String? typeProjectTechnologyValue;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseHelper = DatabaseHelper();
    databaseHelper.initDB();
    getinfo();
  }

  var _gender;
  String genderItem = '';
  Category _category = Category.general;

  String Disability = '';
  String Migration = '';

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<RegValidation>(context);
    return Scaffold(
      key: _drawerkey,
      appBar: CustomAppBar("Registration"),
      drawer: const MainMenu(),
      body: Scrollbar(
        child: Form(
          key: _registerFormKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(
                  formtitle: 'Country:',
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
                      hint: const Text("Select Country"),
                      isExpanded: true,
                      icon: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_drop_down,
                              color: ColorsRes.buttoncolor)),
                      items: country.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: CountryValue,
                      onChanged: (valueSelected) {
                        setState(
                          () {
                            CountryValue = valueSelected as String?;

                            debugPrint('User selected $CountryValue');
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
                FormTitle(formtitle: "Tehsil:"),
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
                      hint: const Text("Select Tehsil"),
                      isExpanded: true,
                      icon: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_drop_down,
                              color: ColorsRes.buttoncolor)),
                      items: tehsil.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: TehsilValue,
                      onChanged: (valueSelected) {
                        setState(
                          () {
                            TehsilValue = valueSelected as String?;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Select Your Tehsil';
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
                FormTitle(formtitle: "Panchayat:"),
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
                      hint: const Text("Select Panchayat"),
                      isExpanded: true,
                      icon: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_drop_down,
                              color: ColorsRes.buttoncolor)),
                      items: panchayat.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: PanchayatValue,
                      onChanged: (valueSelected) {
                        setState(
                          () {
                            PanchayatValue = valueSelected as String?;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Select Your Panchayat';
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
                FormTitle(formtitle: "Gender:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
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
                FormTitle(formtitle: "Household Unique Identifier:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: hh_unique_indetifyController,
                    // validator: validateEmail(TexEd),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // labelText: 'Full Name',
                      hintText: 'Household Unique Identifier',
                      errorText: validationService.hhno.error,
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Enter Your Household Unique Identifier';
                    //   }
                    //   return null;
                    // },
                    onChanged: (value) {
                      validationService.checkNo(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(
                  formtitle: "Name of Beneficiary/Recipient/Customer:",
                ),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: name_of_beneficiary_controller,
                    // validator: validateEmail(TexEd),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // labelText: 'Full Name',
                      hintText: 'Name of Beneficiary/Recipient/Customer',
                     // errorText: validationService.firstName.error,
                    ),
                    validator: (value) {
                      if (value!.isEmpty ) {
                        return 'Enter Name of Beneficiary/Recipient/Customer:';
                      }
                      return null;
                    },
                    // onChanged: (value) {
                    //   validationService.changeFirstName(value);
                    // },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Education:"),
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
                      hint: const Text("Select Education"),
                      isExpanded: true,
                      icon: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_drop_down,
                              color: ColorsRes.buttoncolor)),
                      items: education.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: EducationValue,
                      onChanged: (valueSelected) {
                        setState(
                          () {
                            EducationValue = valueSelected as String?;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Select Your Education';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Primary Occupation:"),
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
                      hint: const Text("Select Primary Occupation "),
                      isExpanded: true,
                      icon: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_drop_down,
                              color: ColorsRes.buttoncolor)),
                      items: occupation.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: OccupationValue,
                      onChanged: (valueSelected) {
                        setState(
                          () {
                            OccupationValue = valueSelected as String?;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Select Your Primary Occupation :';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Number of Household Members:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: number_hh_controller,
                    // validator: validateEmail(TexEd),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // labelText: 'Full Name',
                      hintText: 'Number of Household Members',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Number of Household Members';
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
                    maxLength: 10,
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    // validator: validateEmail(TexEd),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // labelText: 'Full Name',
                      hintText: 'Phone Number',
                      errorText: validationService.phno.error,
                    ),

                    // onChanged: (value) {
                    //   validationService.checkPhoneNo(value);
                    // },
                    validator: (value){
                      if(value!.isEmpty || value.length!=10){
                        return "Please Enter a valid Mobile no";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Aadhar Card:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    maxLength: 12,
                    controller: aadharController,
                    keyboardType: TextInputType.number,
                    // validator: validateEmail(TexEd),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // labelText: 'Full Name',
                      hintText: 'Aadhar Card',
                      errorText: validationService.aadhar.error,
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length!=12) {
                        return 'Enter Number Aadhar Card Number';
                      }
                      return null;
                    },
                    // onChanged: (value) {
                    //   validationService.checkAdhar(value);
                    // },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Category:"),
                SizedBox(
                  height: .5.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabeledRadio(
                        label: 'General',
                        padding: const EdgeInsets.all(0),
                        groupValue: _category,
                        value: Category.general,
                        onChanged: (newValue) {
                          setState(() {
                            _category = newValue;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'OBC',
                        padding: const EdgeInsets.all(0),
                        groupValue: _category,
                        value: Category.obc,
                        onChanged: (newValue) {
                          setState(() {
                            _category = newValue;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'SC',
                        padding: const EdgeInsets.all(0),
                        groupValue: _category,
                        value: Category.sc,
                        onChanged: (newValue) {
                          setState(() {
                            _category = newValue;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'ST',
                        padding: const EdgeInsets.all(0),
                        groupValue: _category,
                        value: Category.st,
                        onChanged: (newValue) {
                          setState(() {
                            _category = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Household Members with Disability:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        // flex: 2,
                        child: RadioListTile(
                          contentPadding: const EdgeInsets.only(
                              // Add this
                              left: 0,
                              right: 0,
                              bottom: 0,
                              top: 0),
                          groupValue: Disability,
                          title: const Text('Yes'),
                          value: 'Yes',
                          onChanged: (val) {
                            setState(() {
                              Disability = val as String;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        // flex: 1,
                        child: RadioListTile(
                          contentPadding: const EdgeInsets.only(
                              // Add this
                              left: 0,
                              right: 0,
                              bottom: 0,
                              top: 0),
                          groupValue: Disability,
                          title: const Text('NO'),
                          value: 'NO',
                          onChanged: (val) {
                            setState(() {
                              Disability = val as String;
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
                FormTitle(
                    formtitle:
                        "If Yes Number of Households Members with Disability:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: numberDisabilityController,
                    keyboardType: TextInputType.number,
                    // validator: validateEmail(TexEd),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // labelText: 'Full Name',
                      hintText: 'Number of Households Members Disability',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Number If Yes Number of Households Members with Disability:';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Seasonal Migration:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        // flex: 2,
                        child: RadioListTile(
                          contentPadding: const EdgeInsets.only(
                              // Add this
                              left: 0,
                              right: 0,
                              bottom: 0,
                              top: 0),
                          groupValue: Migration,
                          title: const Text('Yes'),
                          value: 'Yes',
                          onChanged: (val) {
                            setState(() {
                              Migration = val as String;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        // flex: 1,
                        child: RadioListTile(
                          contentPadding: const EdgeInsets.only(
                              // Add this
                              left: 0,
                              right: 0,
                              bottom: 0,
                              top: 0),
                          groupValue: Migration,
                          title: const Text('NO'),
                          value: 'NO',
                          onChanged: (val) {
                            setState(() {
                              Migration = val as String;
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
                FormTitle(formtitle: "If Yes Seasonal Migration:"),
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
                      hint: const Text("Select If Yes Seasonal Migration: "),
                      isExpanded: true,
                      icon: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: ColorsRes.buttoncolor,
                          )),
                      items: migration.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: migrationValue,
                      onChanged: (valueSelected) {
                        setState(
                          () {
                            migrationValue = valueSelected as String?;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Select If Yes Seasonal Migration:';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Photograph of Household:"),
                SizedBox(
                  height: .5.h,
                ),
                InkWell(
                  child: imageFile != null
                      ? Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          color: Colors.black12,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(
                              imageFile!,
                              width: 80.w,
                              height: 15.h,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(left: 20, right: 40),
                          color: Colors.black12,
                          height: 18.h,
                          width: 200,
                          child: Icon(
                            Icons.image,
                            size: 40.w,
                          ),
                          // width: 3.w,
                        ),
                  onTap: () {
                    _showPicker(context);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Distribution/Sale:"),
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
                      hint: const Text("Select Distribution/Sale: "),
                      isExpanded: true,
                      icon: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: ColorsRes.buttoncolor,
                          )),
                      items: distribution.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: distributionValue,
                      onChanged: (valueSelected) {
                        setState(
                          () {
                            distributionValue = valueSelected as String?;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Select Distribution/Sale';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Model of Project Technology:"),
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
                      hint: const Text("Select Model of Project Technology: "),
                      isExpanded: true,
                      icon: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: ColorsRes.buttoncolor,
                          )),
                      items: Model_of_Project_Technology.map(
                          (String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: modelProjectTechnologyValue,
                      onChanged: (valueSelected) {
                        setState(
                          () {
                            modelProjectTechnologyValue =
                                valueSelected as String?;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Select Model of Project Technology';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Type of Project Technology:"),
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
                      hint: const Text("Select Type of Project Technology "),
                      isExpanded: true,
                      icon: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: ColorsRes.buttoncolor,
                          )),
                      items: Type_of_Project_Technology.map(
                          (String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: typeProjectTechnologyValue,
                      onChanged: (valueSelected) {
                        setState(
                          () {
                            typeProjectTechnologyValue = valueSelected as String?;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Select Type of Project Technology';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(
                    formtitle: "Quantity of Project Technology received/sold:"),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: quantityProjectTechController,
                    keyboardType: TextInputType.number,
                    // validator: validateEmail(TexEd),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // labelText: 'Full Name',
                      hintText: 'Enter Quantity of Project ',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Quantity of Project';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(
                    formtitle:
                        "Quantity of equipment supplied (bottles/containers:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: quantityEquipController,
                    keyboardType: TextInputType.number,
                    // validator: validateEmail(TexEd),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // labelText: 'Full Name',
                      hintText: 'Enter Quantity of equipment',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Quantity of equipment';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Serial Number of Project Technology:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: serialNumberProjectController,

                    // validator: validateEmail(TexEd),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // labelText: 'Full Name',
                      hintText: 'Enter Serial Number of Project Technology ',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Serial Number of Project Technology';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Date of distribution/Sale:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.none,
                    controller: distributionDateController,
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
                      hintText: 'Enter Date of distribution/Sale:',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Date of distribution/Sale:';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormTitle(formtitle: "Date of Technology Training:"),
                SizedBox(
                  height: .5.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.none,
                    controller: trainningDateController,
                    onTap: _handerlDatePickerTraining,
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
                      hintText: 'Enter Date of Technology Training:',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Date of Technology Training:';
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
                  onTap: () {
                    //configLoading();
                   // EasyLoading.show(dismissOnTap: true);
                    isLoading
                        ? const CircularProgressIndicator()
                        : registerUser();
                    //Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 2.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _getFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _getFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _getFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _base64image = base64Encode(imageFile!.readAsBytesSync());
        String fileName = imageFile!.path.split("/").last;
        print(fileName);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    try {
      var pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
          _base64image = base64Encode(imageFile!.readAsBytesSync());
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  registerUser() async {
    final isValid = _registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }else{
    UserRegisterModel userRegisterModel = UserRegisterModel(
      country: CountryValue.toString(),
      state: StateValue.toString(),
      district: DistrictValue.toString(),
      tehsil: TehsilValue.toString(),
      block: BlockValue.toString(),
      panchayat: PanchayatValue.toString(),
      village: VillageValue.toString(),
      gender: genderItem,
      hh_uniqe_indefy: hh_unique_indetifyController.text.toString(),
      name_of_beneficiary: name_of_beneficiary_controller.text.toString(),
      education: EducationValue.toString(),
      occupation: OccupationValue.toString(),
      number_hh_member: int.parse(number_hh_controller.text),
      phone_no: int.parse(phoneController.text),
      aadhar: int.parse(aadharController.text),
      caste_category: _category.toString(),
      hh_disability: Disability.toString(),
      hh_disability_number: int.parse(numberDisabilityController.text),
      season_migration: migrationValue.toString(),
      image: _base64image,
      distribution: distributionValue.toString(),
      model_project_tech: modelProjectTechnologyValue.toString(),
      type_project_tech: typeProjectTechnologyValue.toString(),
      quantity_project_tech: quantityProjectTechController.text.toString(),
      quantity_equip: quantityEquipController.text.toString(),
      serial_num_project: serialNumberProjectController.text.toString(),
      date_of_sale: distributionDateController.text.toString(),
      date_of_tech_training: trainningDateController.text.toString(),
    );
    databaseHelper.insertData(userRegisterModel);
    isLoading = false;

    print(userRegisterModel);
    }
  }
}

class LabeledRadio extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final Category groupValue;
  final Category value;
  final Function onChanged;

  const LabeledRadio(
      {Key? key,
      required this.label,
      required this.padding,
      required this.groupValue,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<Category>(
              groupValue: groupValue,
              value: value,
              onChanged: (newValue) {
                onChanged(newValue);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
