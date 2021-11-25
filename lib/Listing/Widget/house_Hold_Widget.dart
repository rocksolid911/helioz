import 'package:flutter/material.dart';
import 'package:helioz/common/widgets/text_style.dart';
import 'package:helioz/Home/House_%20Hold/Screen/house_hold_details.dart';
import 'package:sizer/sizer.dart';

Widget HouseHoldContainer() {
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
                  border: Border.all(),
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                    child: Text(
                  "AI",
                  style: heading,
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
                  border: Border.all(),
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                    child: Text(
                  "RT",
                  style: heading,
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
                  border: Border.all(),
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                    child: Text(
                  "RE",
                  style: heading,
                )),
              ),
            ),
            InkWell(
              child: Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 6.h,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.grey,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "View",
                    style: heading,
                  )),
                ),
              ),
              onTap: () {},
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                height: 6.h,
                // width: 15.h,
                // alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                    child: Text(
                  "Dropout",
                  style: heading,
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
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
