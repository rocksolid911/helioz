import 'package:flutter/material.dart';
import 'package:helioz/Auth/Login/Screen/login_screen.dart';
import 'package:helioz/common/splash/screen/splash.dart';
import 'package:sizer/sizer.dart';

import 'Auth/Registration/Screen/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {

      return const MaterialApp(

        debugShowCheckedModeBanner: false,

        // home: LoginScreen(),
        home: SplashScreen(),
      );
    });
  }
}
