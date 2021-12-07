import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:helioz/route.dart';
import 'package:sizer/sizer.dart';
import 'Change_HH_Status/Screen/chnage_hh_status.dart';
import 'common/Validation/preregvalidation.dart';
import 'common/Validation/registrationvalidation.dart';
import 'common/Validation/signinvalidation.dart';
import 'common/splash/screen/splash.dart';
import 'package:provider/provider.dart';

import 'common/widgets/customanimation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegValidation()),
        ChangeNotifierProvider(create: (context) =>  PreRegValidation()),
        ChangeNotifierProvider(create: (context) =>  SignInValidation()),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      }),
    );
  }
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..customAnimation = CustomAnimation();
}