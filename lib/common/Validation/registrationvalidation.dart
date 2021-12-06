import 'package:flutter/material.dart';
import 'package:helioz/common/Validation/validationitem.dart';



class SignupValidation with ChangeNotifier {


  static final RegExp nameRegExp =RegExp('[a-zA-Z]');
  static final RegExp numberRegExp = RegExp(r'\d');

  ValidationItem _firstName = ValidationItem(null,null);
  ValidationItem _lastName = ValidationItem(null,null);
  ValidationItem _dob = ValidationItem(null,null);
   ValidationItem _hhno = ValidationItem(null, null);
  ValidationItem _phno = ValidationItem(null, null);
  ValidationItem _aadhar = ValidationItem(null, null);

//Getters
  ValidationItem get firstName => _firstName;
  ValidationItem get lastName => _lastName;
  ValidationItem get hhno => _hhno;
  ValidationItem get phno => _phno;
  ValidationItem get dob => _dob;
  ValidationItem get aadhar => _aadhar;
  bool get isValid {
    if (_lastName.value != null && _firstName.value != null && dob.value != null){
      return true;
    } else {
      return false;
    }
  }

//Setters
  void changeFirstName(String value){
    if (value.length >= 3 && nameRegExp.hasMatch(value)  ){
      _firstName=ValidationItem(value,null);
    } else {
      _firstName=ValidationItem(null, "Input Must be at least 3 characters and Letters");
    }
    notifyListeners();
  }

  void changeLastName(String value){
    if (value.length >= 5){
      _lastName=ValidationItem(value,null);
    } else {
      _lastName=ValidationItem(null, "Must be at least 5 characters");
    }
    notifyListeners();
  }

  void changeDOB(String value){
    try {
      DateTime.parse(value);
      _dob=ValidationItem(value,null);
    } catch(error){
      _dob =ValidationItem(null, "Invalid Format");
    }
    notifyListeners();
  }

  void checkNo(String value){
    if (numberRegExp.hasMatch(value)){
      _hhno=ValidationItem(value,null);
    } else {
      _lastName=ValidationItem(null, "Please input numbers only");
    }
    notifyListeners();
  }
  void checkPhoneNo(String value){
    if(numberRegExp.hasMatch(value) && value.length==10){
      _phno=ValidationItem(value, null);
    }else {
      _phno=ValidationItem(null, "Please enter a 10 digit no");
    }
    notifyListeners();
  }
  void checkAdhar(String value){
    if(numberRegExp.hasMatch(value) && value.length==12){
      _aadhar=ValidationItem(value, null);
    }else {
      _aadhar=ValidationItem(null, "Please enter a 12 digit valid aadhar no");
    }
    notifyListeners();
  }
  void submitData(){
    print("FirstName: ${firstName.value}, LastName: ${lastName.value}");
    }


}