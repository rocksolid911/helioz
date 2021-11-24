import 'package:flutter/material.dart';
import 'package:helioz/common/Drawer/widgets/drawer.dart';

import 'package:sizer/sizer.dart';

class DashBoard extends StatefulWidget {
   const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      appBar: AppBar(
        title: const Text("Dashboard",style: TextStyle(color: Color(0xFF5B81E8)),),
        iconTheme: const IconThemeData(color: Color(0xFF5B81E8)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          const Icon(Icons.reply,color: Color(0xFF5B81E8),),
          SizedBox(
            width: 7.w,
          ),
        ],
      ),
      drawer: const myDrawer(),
      body:Container(),
    );

  }
}
