import 'package:flutter/material.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:helioz/common/widgets/text_style.dart';

import 'package:sizer/sizer.dart';

Widget HouseHoldContainer(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2.h),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text("Name: Kedar Dash",
            textAlign: TextAlign.start, style: listHouseHoldStyle),
        const SizedBox(
          height: 5,
        ),
        Text("Village: Tal, PO: Diptipur, Odisha",
            textAlign: TextAlign.start, style: listHouseHoldStyle),
        const SizedBox(
          height: 5,
        ),
        Text("Technology Given On: November 15, 2021",
            textAlign: TextAlign.start, style: listHouseHoldStyle),
        const SizedBox(
          height: 5,
        ),
        Text("Monitored on : December 12, 2021",
            textAlign: TextAlign.start, style: listHouseHoldStyle),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                height: 6.h,
                // width: 15.h,
                // alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: ColorsRes.buttoncolor,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                    child: Text(
                  "AI",
                  style: buttonTextStyle,
                )),
              ),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 6.h,
                  // width: 15.h,
                  // alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: ColorsRes.buttoncolor,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "RT",
                    style: buttonTextStyle,
                  )),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/replace_techno');
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 6.h,
                  // width: 15.h,
                  // alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: ColorsRes.buttoncolor,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "RE",
                    style: buttonTextStyle,
                  )),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/replace_equip');
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                height: 6.h,
                decoration: BoxDecoration(
                  // ,
                  color: ColorsRes.buttoncolor,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                    child: Text(
                  "View",
                  style: buttonTextStyle,
                )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                height: 6.h,
                // width: 15.h,
                // alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: ColorsRes.buttoncolor,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                    child: Text(
                  "Dropout",
                  style: buttonTextStyle,
                )),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: const Divider(
            thickness: 2,
            color: ColorsRes.buttoncolor,
          ),
        ),
      ],
    ),
  );
}
