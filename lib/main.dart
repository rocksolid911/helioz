import 'package:flutter/material.dart';
import 'package:helioz/route.dart';
import 'package:sizer/sizer.dart';
import 'Change_HH_Status/Screen/chnage_hh_status.dart';
import 'common/splash/screen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
