import 'package:flutter/material.dart';

import 'package:helioz/Auth/Login/Screen/newlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: AlertDialog(
          title: const Text('Welcome'),  // To display the title it is optional
          content: const Text('GeeksforGeeks'),   // Message which will be pop up on the screen
          // Action widget which will provide the user to acknowledge the choice
          actions: [
            TextButton(           // FlatButton widget is used to make a text to work like a button
             // textColor: Colors.black,
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.pop(context);
              },        // function used to perform after pressing the button
              child: const Text('CANCEL'),
            ),
            TextButton(
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.red)),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('userId');
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext ctx) => const WRLogin2()));
              },
              child: const Text('LOGOUT'),
            ),
          ],
        ),
      ),
    );
  }
}
