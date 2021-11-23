import 'package:flutter/material.dart';



class BuildTextField extends StatefulWidget {
  final String labelText;
  final String placeholder;
  final bool isPassword;
  const BuildTextField(
      {Key? key,
      required this.labelText,
      required this.placeholder,
      required this.isPassword})
      : super(key: key);

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  bool  _obscureText = true;
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
        ),
        TextField(
         // obscuringCharacter: "*",
          style: const TextStyle(color: Color(0xFF5B81E8)),
          obscureText: widget.isPassword==true?_obscureText:false,
          decoration: InputDecoration(
            hintText: widget.placeholder,
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
                      color: const Color(0xFF5B81E8),
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
            :null,
          ),
        ),
      ],
    );
  }
}
// Container buildTextField(
//     String labelText, String placeholder, bool isPassword) {
//
//   );
