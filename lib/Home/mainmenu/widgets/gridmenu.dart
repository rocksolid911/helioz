import 'package:flutter/material.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:sizer/sizer.dart';

class GridMenu extends StatelessWidget {
  final String img;
  final String path;
  final String title;
  const GridMenu({
    Key? key,
    required this.img,
    required this.path,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: ColorsRes.newAppColor, // Set border color
                width: 3.0), // Set border width
            borderRadius: const BorderRadius.all(
                Radius.circular(10.0)), // Set rounded corner radius
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
            ] // Make rounded corner of border
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              img,
              height: 15.h,
              width: 16.w,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, path);
      },
    );
  }
}
