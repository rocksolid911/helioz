import 'package:flutter/material.dart';

import 'package:helioz/route.dart';
import 'package:sizer/sizer.dart';

import 'common/splash/screen/splash.dart';

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
        home: SplashScreen(),
        onGenerateRoute: RouteGenerator.generateRoute,
      );
    });
  }
}
