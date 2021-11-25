import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:helioz/Auth/Registration/Data/drop_down_data.dart';
import 'package:helioz/common/widgets/text_style.dart';
import 'package:helioz/common/Drawer/widgets/drawer.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

final menuScreenKey = GlobalKey(debugLabel: 'MenuScreen');

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  File? imageFile;
  DateTime _date = DateTime.now();
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  TextEditingController distributionDateController = TextEditingController();
  TextEditingController trainningDateController = TextEditingController();

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

  var _gender;
  String radioItem = '';
  String Category = '';
  String Disability = '';
  String Migration = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      appBar: AppBar(
        title: const Text(
          "Registration",
          style: TextStyle(color: Color(0xFF5B81E8)),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF5B81E8)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          const Icon(
            Icons.reply,
            color: Color(0xFF5B81E8),
          ),
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
                "Country",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "State",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "District",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Tehsil",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Block",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Panchayat",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Village",
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
                      return 'Select Your Village';
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
                "Gender:",
                style: heading,
              ),
            ),
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
                      groupValue: radioItem,
                      title: const Text('Male'),
                      value: 'Male',
                      onChanged: (val) {
                        setState(() {
                          radioItem = val as String;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      groupValue: radioItem,
                      title: const Text('Female'),
                      value: 'Female',
                      onChanged: (val) {
                        setState(() {
                          radioItem = val as String;
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
                "Household Unique Identifier:",
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
                  hintText: 'Household Unique Identifier',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Household Unique Identifier';
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
                "Name of Beneficiary/Recipient/Customer:",
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
                  hintText: 'Name of Beneficiary/Recipient/Customer',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Name of Beneficiary/Recipient/Customer:';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Education",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Primary Occupation :",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
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
                  hintText: 'Phone Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone Number:';
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
                "Aadhar Card:",
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
                  hintText: 'Aadhar Card',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Number Aadhar Card Number';
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
                "Category:",
                style: heading,
              ),
            ),
            SizedBox(
              height: .5.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 20),
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
                      groupValue: Category,
                      title: const Text(
                        'General',
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            // maxLines: 1,

                            ),
                      ),
                      value: 'General',
                      onChanged: (val) {
                        setState(() {
                          Category = val as String;
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
                      groupValue: Category,
                      title: const Text('OBC'),
                      value: 'OBC',
                      onChanged: (val) {
                        setState(() {
                          Category = val as String;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.only(
                          // Add this
                          left: 0,
                          right: 0,
                          bottom: 0,
                          top: 0),
                      groupValue: Category,
                      title: const Text('SC'),
                      value: 'SC',
                      onChanged: (val) {
                        setState(() {
                          Category = val as String;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.only(
                          // Add this
                          left: 0,
                          right: 0,
                          bottom: 0,
                          top: 0),
                      groupValue: Category,
                      title: const Text('ST'),
                      value: 'ST',
                      onChanged: (val) {
                        setState(() {
                          Category = val as String;
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
                "Household Members with Disability:",
                style: heading,
              ),
            ),
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "If Yes Number of Households Members with Disability:",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Seasonal Migration:",
                style: heading,
              ),
            ),
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "If Yes Seasonal Migration:",
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
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Photograph of Household",
                style: heading,
              ),
            ),
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
                      margin: EdgeInsets.only(left: 20, right: 40),
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Distribution/Sale:",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Model of Project Technology:",
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
                        modelProjectTechnologyValue = valueSelected as String?;
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Type of Project Technology:",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Quantity of Project Technology received/sold:",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Quantity of equipment supplied (bottles/containers):",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Serial Number of Project Technology:",
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Date of Technology Training:",
                style: heading,
              ),
            ),
            SizedBox(
              height: .5.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
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
        // _base64Profile = base64Encode(imageFile.readAsBytesSync());
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
          // _base64Profile = base64Encode(imageFile.readAsBytesSync());
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
