import 'package:flutter/material.dart';
import 'package:helioz/common/Validation/signinvalidation.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuildTextField extends StatefulWidget {
  final String labelText;
  final String placeholder;
  final bool isPassword;
  final TextEditingController controller;

  const BuildTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.placeholder,
    required this.isPassword,
  }) : super(key: key);

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignInValidation>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
        ),
        TextField(
          controller: widget.controller,
          onChanged: widget.isPassword == false
              ? (value) {
                  validationService.ceckEmail(value);
                }
              : null,
          // obscuringCharacter: "*",
          style: const TextStyle(color: Color(0xFF5B81E8)),
          obscureText: widget.isPassword == true ? _obscureText : false,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            errorText: widget.isPassword == false
                ? validationService.email.error
                : null,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF5B81E8)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            suffixIcon: widget.isPassword == true
                ? GestureDetector(
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: ColorsRes.newAppColor,
                    ),
                    onTap: () {
                      setState(
                        () {
                          _obscureText = !_obscureText;
                        },
                      );
                    },
                  )
                //: Container(),
                : null,
          ),
        ),
      ],
    );
  }
  // loginUser() async {
  //   final SharedPreferences sharedPreferences =
  //   await SharedPreferences.getInstance();
  //   sharedPreferences.setString("userId", widget.controller.text);
  //
  //   if(widget.controller.text.isNotEmpty){
  //     Navigator.pushReplacementNamed(context, "/dashboard");
  //   }else{
  //     print("no user");
  //   }
  //
  // }
}

