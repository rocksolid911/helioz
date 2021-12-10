import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helioz/Auth/Login/Screen/loginscreen.dart';
import 'package:helioz/Home/mainmenu/screens/mainmenu.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:helioz/common/splash/widgets/introslideractivity.dart';
import 'package:helioz/common/widgets/designconfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  String? finalEmail;

  @override
  void initState() {
    super.initState();
    getvalidationData().whenComplete(() async {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
                  finalEmail == null ? const WRLogin1() : const MainMenu())));
    });
  }

  Future getvalidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainEmail = sharedPreferences.getString("userId");
    setState(() {
      finalEmail = obtainEmail!;
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorsRes.newAppColor,
          // gradient: DesignConfig.gradient,
        ),
        child: Center(
          child: Image.asset(
            'assets/images/Helioz_logo_blau_claim_RGB_-2.png',
            color: ColorsRes.logoColor,
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
      ),
    );
  }
}
