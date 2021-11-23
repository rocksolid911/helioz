import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorsRes {
  // static const Color appcolor = Color(0xff838aea);
  static const Color introTitlecolor = Color(0xff333333);
  static const Color introMessagecolor = Color(0xff98a1af);
  static const Color notificationIconColor = Color(0xff454f63);
  // static const Color white = Color(0xFFffffff);
  // static const Color black = Color(0xFF000000);
  static const Color bgPage = Color(0xfff8f9fb);
  static const Color lightgraycolor = Color(0xff959294);
  static const Color buttoncolor = Color(0xff838aea);
  static const Color black12 = Color(0x1F000000);
  //static const Color bgcolor = Color(0xFFF5F5F5);
  static const Color applightcolor = Color(0xffc8c8f6);
  static const Color searplaceholdercolor = Color(0xffd0d0d0);
  static const Color radiobuttoncolor = Color(0xffd4d8de);
  static const Color tabItemColor = Color(0xff011738);
//  static const Color firstgradientcolor = Color(0xff838aea);
  // static const Color secondgradientcolor = Color(0xff796fc1);
  // static const Color red =  Color(0xFFc30014);
  //static const Color green = Color(0xFF60aa00);

  // static const MaterialColor appcolor_material = MaterialColor(
  //   0xFF3A236E,
  //   <int, Color>{
  //     50: Color(0xff838aea),
  //     100: Color(0xff838aea),
  //     200: Color(0xff838aea),
  //     300: Color(0xff838aea),
  //     400: Color(0xff838aea),
  //     500: Color(0xff838aea),
  //     600: Color(0xff838aea),
  //     700: Color(0xff838aea),
  //     800: Color(0xff838aea),
  //     900: Color(0xff838aea),
  //   },
  // );
  static const Color appcolor = Color(0xFF7D8CEB);
  static const Color introbackcolor = Color(0xFF5B81E8);
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF000000);
  static const Color bgcolor = Color(0xFFEEEEEE);
  static const Color blue = Color(0xFF345EB4);
  static const Color yellow = Color(0xFFF8D320);
  static const Color textblack = Color(0xFF2D2D2D);
  static const Color grey = Color(0xFF686868);
  static const Color firstgradientcolor = Color(0xFF4F6FC8);
  static const Color secondgradientcolor = Color(0xFF7D8CEB);
  static const Color thirdgradientcolor = Color(0xFF345EB4);
  static const Color fbcolor = Color(0xFF345EB4);
  static const Color googlecolor = Color(0xFFdd4b39);
  static const Color red = Color(0xFFD32F2F);
  static const Color green = Color(0xff00d285);

  static const Color btnlightshadow = Color(0x1affffff);

  static const Color categorycolor1 = Color(0xffF91E8F);
  static const Color categorycolor2 = Color(0xff0FD7D1);
  static const Color categorycolor3 = Color(0xffF9C11E);
  static const Color categorycolor4 = Color(0xff7B0CEA);
  static const Color categorycolor5 = Color(0xff5BD70F);
  static const Color categorycolor6 = Color(0xffF9601E);
  static const Color categorycolor7 = Color(0xff0F73D7);
  static const Color categorycolor8 = Color(0xffF23C63);

  static const MaterialColor appcolor_material = MaterialColor(
    0xFF19294a,
    <int, Color>{
      50: Color(0xFF19294a),
      100: Color(0xFF19294a),
      200: Color(0xFF19294a),
      300: Color(0xFF19294a),
      400: Color(0xFF19294a),
      500: Color(0xFF19294a),
      600: Color(0xFF19294a),
      700: Color(0xFF19294a),
      800: Color(0xFF19294a),
      900: Color(0xFF19294a),
    },
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
    fontFamily: 'MyFont',
    iconTheme: const IconThemeData(
      color: ColorsRes.white,
    ),
    primaryTextTheme:
        const TextTheme(headline6: TextStyle(color: ColorsRes.appcolor)),
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: ColorsRes.appcolor_material)
            .copyWith(secondary: ColorsRes.appcolor),
  );

  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white54,
    fontFamily: 'MyFont',
    iconTheme: const IconThemeData(
      color: ColorsRes.white,
    ),
    primaryTextTheme:
        const TextTheme(headline6: TextStyle(color: ColorsRes.appcolor)),
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: ColorsRes.appcolor_material)
            .copyWith(secondary: ColorsRes.appcolor),
  );
}
