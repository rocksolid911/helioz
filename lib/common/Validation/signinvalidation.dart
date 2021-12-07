import 'package:flutter/material.dart';
import 'package:helioz/common/Validation/validationitem.dart';



class SignInValidation with ChangeNotifier {


  static final RegExp nameRegExp =RegExp('[a-zA-Z]');
  static final RegExp numberRegExp = RegExp(r'\d');
  static final RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");



  ValidationItem _email = ValidationItem(null,null);
  //ValidationItem _passwd = ValidationItem(null,null);

//Getters

  //ValidationItem get passwd => _passwd;
  ValidationItem get email => _email;

  bool get isValid {
    if ( _email.value != null ){
      return true;
    } else {
      return false;
    }
  }

//Setters
  void ceckEmail(String value){
    if (emailRegExp.hasMatch(value)  ){
      _email=ValidationItem(value,null);
    } else {
      _email=ValidationItem(null, "Please enter a valid email Id");
    }
    notifyListeners();
  }





  void submitData(){
    print("submiited");
  }


}