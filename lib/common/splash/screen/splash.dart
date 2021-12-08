import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helioz/Auth/Login/Screen/loginscreen.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:helioz/common/splash/widgets/introslideractivity.dart';
import 'package:helioz/common/widgets/designconfig.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    callNextPage();
  }

  callNextPage() {
    Timer(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(
        context,
       // MaterialPageRoute(builder: (context) => const IntroSliderActivity()),
        MaterialPageRoute(builder: (context) => const WRLogin1()),
      );
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
