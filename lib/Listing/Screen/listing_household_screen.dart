import 'package:flutter/material.dart';
import 'package:helioz/Auth/Registration/Widget/text_style.dart';
import 'package:helioz/Listing/Widget/house_Hold_Widget.dart';
import 'package:helioz/common/Drawer/widgets/drawer.dart';
import 'package:sizer/sizer.dart';

class ListHouseHoldScreen extends StatefulWidget {
  const ListHouseHoldScreen({Key? key}) : super(key: key);

  @override
  _ListHouseHoldScreenState createState() => _ListHouseHoldScreenState();
}

class _ListHouseHoldScreenState extends State<ListHouseHoldScreen> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerkey,
        drawer: const myDrawer(),
        appBar: AppBar(
          title: Text(
            "Listing House Hold",
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5B81E8)),
          ),
          iconTheme: const IconThemeData(color: Color(0xFF5B81E8)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            const Icon(Icons.reply),
            SizedBox(
              width: 7.w,
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Text(
                "Listing House hold",
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    // height: 7.h,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      // validator: validateEmail(TexEd),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        // labelText: 'Full Name',
                        hintText: 'Enter Full Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Full Name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 7.h,
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
                          "Search",
                          style: heading,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.h),
              child: const Divider(
                thickness: 2,
                color: Colors.black54,
              ),
            ),
            HouseHoldContainer(),
            HouseHoldContainer(),
            HouseHoldContainer(),
            HouseHoldContainer(),

          ],
        ),
      ),
    );
  }

//   Container HouseHoldContainer() {
//     return Container(
//             margin: EdgeInsets.symmetric(horizontal: 2.h),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text("Name: Kedar Dash",
//                     textAlign: TextAlign.start, style: listHouseHoldStyle),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text("Village: Tal, PO: Diptipur, Odisha",
//                     textAlign: TextAlign.start, style: listHouseHoldStyle),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text("Technology Given On: November 15, 2021",
//                     textAlign: TextAlign.start, style: listHouseHoldStyle),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text("Monitored on : December 12, 2021",
//                     textAlign: TextAlign.start, style: listHouseHoldStyle),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Container(
//                         margin: const EdgeInsets.only(right: 5),
//                         height: 6.h,
//                         // width: 15.h,
//                         // alignment: Alignment.bottomRight,
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           color: Colors.grey,
//                           shape: BoxShape.rectangle,
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(10.0),
//                           ),
//                         ),
//                         child: Center(
//                             child: Text(
//                           "AI",
//                           style: heading,
//                         )),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Container(
//                         margin: const EdgeInsets.only(right: 5),
//                         height: 6.h,
//                         // width: 15.h,
//                         // alignment: Alignment.bottomRight,
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           color: Colors.grey,
//                           shape: BoxShape.rectangle,
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(10.0),
//                           ),
//                         ),
//                         child: Center(
//                             child: Text(
//                           "RT",
//                           style: heading,
//                         )),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Container(
//                         margin: const EdgeInsets.only(right: 5),
//                         height: 6.h,
//                         // width: 15.h,
//                         // alignment: Alignment.bottomRight,
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           color: Colors.grey,
//                           shape: BoxShape.rectangle,
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(10.0),
//                           ),
//                         ),
//                         child: Center(
//                             child: Text(
//                           "RE",
//                           style: heading,
//                         )),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Container(
//                         margin: const EdgeInsets.only(right: 5),
//                         height: 6.h,
//                         // width: 15.h,
//                         // alignment: Alignment.bottomRight,
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           color: Colors.grey,
//                           shape: BoxShape.rectangle,
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(10.0),
//                           ),
//                         ),
//                         child: Center(
//                             child: Text(
//                           "View",
//                           style: heading,
//                         )),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Container(
//                         margin: const EdgeInsets.only(right: 5),
//                         height: 6.h,
//                         // width: 15.h,
//                         // alignment: Alignment.bottomRight,
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           color: Colors.grey,
//                           shape: BoxShape.rectangle,
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(10.0),
//                           ),
//                         ),
//                         child: Center(
//                             child: Text(
//                           "Dropout",
//                           style: heading,
//                         )),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 1.h,
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 2.w),
//                   child: const Divider(
//                     thickness: 2,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }
}
