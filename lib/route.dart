import 'package:flutter/material.dart';
import 'package:helioz/Auth/Login/Screen/loginscreen.dart';
import 'package:helioz/Auth/Login/Screen/signupscreen.dart';
import 'package:helioz/Home/Dashboard/Screen/dash_board.dart';
import 'package:helioz/Home/Help/Screen/help_screen.dart';
import 'package:helioz/Home/mainmenu/screens/mainmenu.dart';
import 'package:helioz/Listing/Screen/listing_household_screen.dart';
import 'Home/Monitoring/Screen/project_technology_screen.dart';
import 'Listing/Replace_of_Equipment /Screen/replace_equipment.dart';
import 'Listing/Replace_of_Technology/Screen/replace_technology.dart';
import 'Pre_registration/Screen/pre_registration_screen.dart';
import 'Preference/Screen/preference_screen.dart';
import 'Registration/Screen/registration_screen.dart';
import 'common/splash/screen/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const WRLogin1(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => WRSingup1(),
        );
      case '/dashboard':
        return MaterialPageRoute(
          builder: (_) => const MainMenu(),
        );
      case '/reg':
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );
      case '/list':
        return MaterialPageRoute(
          builder: (_) => const ListHouseHoldScreen(),
        );
      case '/pre-reg':
        return MaterialPageRoute(
          builder: (_) => const PreRegistrationScreen(),
        );
      case '/replace_equip':
        return MaterialPageRoute(
          builder: (_) => const ReplaceEquipmentScreen(),
        );
      case '/replace_techno':
        return MaterialPageRoute(
          builder: (_) => const ReplaceTechnologyScreen(),
        );
      case '/project-tech':
        return MaterialPageRoute(
          builder: (_) => const TechnologyScreen(),
        );
      case '/preference':
        return MaterialPageRoute(
          builder: (_) => const PreferenceScreen(),
        );
      case '/help':
        return MaterialPageRoute(
          builder: (_) => const HelpScreen(),
        );
      case '/dash':
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );

        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
