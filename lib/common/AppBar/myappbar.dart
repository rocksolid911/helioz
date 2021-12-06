import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../colorsres.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  CustomAppBar(
    this.title, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: ColorsRes.buttoncolor,
            fontFamily: "Futura"
        ),
      ),
      iconTheme: const IconThemeData(color: ColorsRes.buttoncolor),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        GestureDetector(
          child: const Icon(Icons.reply),
          onTap: () => Navigator.pop(context),
        ),
        SizedBox(
          width: 7.w,
        ),
      ],
    );
  }
}
