import 'dart:math';

import 'package:flutter/material.dart';
import 'package:helioz/Home/mainmenu/widgets/gridmenu.dart';

import 'package:helioz/common/Drawer/widgets/drawer.dart';

import 'package:sizer/sizer.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerkey,
        appBar: AppBar(
          elevation:5,
          centerTitle: true,
          title: const Text(
            "MAIN MENU",
            style: TextStyle(color: Color(0xFF5B81E8)),
          ),
          iconTheme: const IconThemeData(color: Color(0xFF5B81E8)),
          backgroundColor: Colors.transparent,
         // elevation: 0.0,
         //  actions: [
         //    const Icon(
         //      Icons.reply,
         //      color: Color(0xFF5B81E8),
         //    ),
         //    SizedBox(
         //      width: 7.w,
         //    ),
         //  ],
        ),
        //drawer: const myDrawer(),
        body: GridView.extent(
          childAspectRatio: (2 / 2),
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          padding: const EdgeInsets.all(10.0),
          maxCrossAxisExtent: 200.0,

          children: const [
            GridMenu(
              img: 'assets/helioz-menu-icons/pre-registration.png',
              path: '/pre-reg',
              title: 'Pre-Registration',
            ),
            GridMenu(
              img: 'assets/helioz-menu-icons/registration-distribution.png',
              path: '/reg',
              title: 'Registration',
            ),
            GridMenu(
              img: 'assets/helioz-menu-icons/list.png',
              path: '/list',
              title: 'List',
            ),
            GridMenu(
              img: 'assets/helioz-menu-icons/monitoring.png',
              path: '/pre-reg',
              title: 'Pre-Registration',
            ),
            GridMenu(
              img: 'assets/helioz-menu-icons/dashboard.png',
              path: '/dash',
              title: 'Dashboard',
            ),
            GridMenu(
              img: 'assets/helioz-menu-icons/preference.png',
              path: '/preference',
              title: 'Preferences',
            ),
            GridMenu(
              img: 'assets/helioz-menu-icons/help.png',
              path: '/help',
              title: 'Help',
            ),
            GridMenu(
              img: 'assets/helioz-menu-icons/logout.png',
              path: '/login',
              title: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}

class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}
