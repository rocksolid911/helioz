import 'package:flutter/material.dart';
import 'package:helioz/Auth/Registration/Data/drop_down_data.dart';
import 'package:helioz/Auth/Registration/Widget/text_style.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          const Icon(Icons.share),
          SizedBox(
            width: 7.w,
          ),
        ],
      ),
      drawer: const Drawer(),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Registration",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
            ),
          ),
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
            height: 7.h,
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
                    child: Icon(Icons.arrow_drop_down)),
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
            height: 7.h,
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
                    child: Icon(Icons.arrow_drop_down)),
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
            height: 7.h,
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
                    child: Icon(Icons.arrow_drop_down)),
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
            height: 7.h,
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
                    child: Icon(Icons.arrow_drop_down)),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Block",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: Text("Select Block"),
                isExpanded: true,
                icon: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Panchayat",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
                    child: Icon(Icons.arrow_drop_down)),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Village",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
                    child: Icon(Icons.arrow_drop_down)),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Gender:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            // margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                    groupValue: radioItem,
                    title: Text('Male'),
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
                    title: Text('Female'),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Household Unique Identifier:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Name of Beneficiary/Recipient/Customer:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: Text("Select Education"),
                isExpanded: true,
                icon: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Primary Occupation :",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: Text("Select Primary Occupation "),
                isExpanded: true,
                icon: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Number of Household Members:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Phone Number:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Aadhar Card:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Category:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 10, right: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 2,
                  child: RadioListTile(
                    contentPadding: EdgeInsets.only(
                        // Add this
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0),
                    groupValue: Category,
                    title: Text(
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
                    contentPadding: EdgeInsets.only(
                        // Add this
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0),
                    groupValue: Category,
                    title: Text('OBC'),
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
                    contentPadding: EdgeInsets.only(
                        // Add this
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0),
                    groupValue: Category,
                    title: Text('SC'),
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
                    contentPadding: EdgeInsets.only(
                        // Add this
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0),
                    groupValue: Category,
                    title: Text('ST'),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Household Members with Disability:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 2,
                  child: RadioListTile(
                    contentPadding: EdgeInsets.only(
                        // Add this
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0),
                    groupValue: Disability,
                    title: Text('Yes'),
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
                    contentPadding: EdgeInsets.only(
                        // Add this
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0),
                    groupValue: Disability,
                    title: Text('NO'),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "If Yes Number of Households Members with Disability:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Seasonal Migration:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 2,
                  child: RadioListTile(
                    contentPadding: EdgeInsets.only(
                        // Add this
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0),
                    groupValue: Migration,
                    title: Text('Yes'),
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
                    contentPadding: EdgeInsets.only(
                        // Add this
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0),
                    groupValue: Migration,
                    title: Text('NO'),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "If Yes Seasonal Migration:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: Text("Select If Yes Seasonal Migration: "),
                isExpanded: true,
                icon: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
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
          Container(
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
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Distribution/Sale:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: Text("Select Distribution/Sale: "),
                isExpanded: true,
                icon: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Model of Project Technology:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: Text("Select Model of Project Technology: "),
                isExpanded: true,
                icon: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Type of Project Technology:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: Text("Select Type of Project Technology "),
                isExpanded: true,
                icon: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items:
                    Type_of_Project_Technology.map((String dropDownStringItem) {
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Quantity of Project Technology received/sold:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Quantity of equipment supplied (bottles/containers):",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Serial Number of Project Technology:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Date of distribution/Sale:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: distributionDateController,
              onTap: _handerlDatePicker,
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_today),
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
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Date of Technology Training:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: trainningDateController,
              onTap: _handerlDatePickerTraining,
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_today),
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
              margin: EdgeInsets.only(right: 20, top: 20),
              height: 6.h,
              width: 15.h,
              // alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.black12,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Center(child: Text("Submit")),
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
