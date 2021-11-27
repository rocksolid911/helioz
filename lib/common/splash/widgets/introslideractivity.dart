import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:helioz/Auth/Login/Screen/loginscreen.dart';
import 'package:helioz/common/widgets/colorsres.dart';
import 'package:helioz/common/widgets/stringsres.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import 'newdialog.dart';

class IntroSliderActivity extends StatefulWidget {
  const IntroSliderActivity({Key? key}) : super(key: key);

  @override
  IntroSliderState createState() => IntroSliderState();
}

class IntroSliderState extends State<IntroSliderActivity> {
  final _controller = PageController();
  double? bottompadding;
  int currentpage = 0;
  bool isdialogshown = false;

  final _images = [
    "assets/images/helozwadi.jpg",
    "assets/images/helozwadi2.jpg",
    "assets/images/helozwadi3.jpeg",
  ];
  final _introsubtext = [
    StringsRes.intro1,
    StringsRes.intro2,
    StringsRes.intro3,
  ];
  final _introtitle = [
    StringsRes.introtitle1,
    StringsRes.introtitle2,
    StringsRes.introtitle3,
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      bottompadding = (MediaQuery.of(context).size.height / 2) - 50;
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        //constraints: BoxConstraints.expand(),
        backgroundColor: ColorsRes.buttoncolor,
        /*decoration: BoxDecoration(
          gradient: new RadialGradient(
            colors: [
              ColorsRes.secondgradientcolor,
              ColorsRes.firstgradientcolor,
              ColorsRes.thirdgradientcolor,
            ],
          ),
        ),*/
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < 3; i++)
                      if (i == currentpage) ...[circleBar(true)] else
                        circleBar(false),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            AnimatedOpacity(
              opacity: currentpage == 2 ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (context) => const WRLogin1()));
                },
                child: Container(
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorsRes.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 13),
                    margin: EdgeInsets.only(left: 12, right: 12, bottom: 20),
                    child: Text(
                      "Get Started",
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                          const TextStyle(
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
            )
          ],
        ),
        body: PageView(
          physics: const ClampingScrollPhysics(),
          controller: _controller,
          onPageChanged: (int pageno) {
            setState(() {
              currentpage = pageno;
            });

            if (currentpage == 2 && !isdialogshown) {
              openNotificationDialog();
              setState(() {
                isdialogshown = true;
              });
            }
          },
          children: List.generate(3, (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text(
                //   _introtitle[currentpage],
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context).textTheme.headline5!.merge(
                //       const TextStyle(
                //           color: ColorsRes.white,
                //           decoration: TextDecoration.none,
                //           fontWeight: FontWeight.bold,
                //           fontFamily: 'MyFont')),
                // ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    _images[currentpage],
                    // fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    _introsubtext[currentpage],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                          TextStyle(
                            color: ColorsRes.white,
                            decoration: TextDecoration.none,
                            height: 1.3,
                            letterSpacing: 0.5,
                            fontFamily: 'MyFont',
                            fontSize: 16.sp,
                          ),
                        ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      height: isActive ? 12 : 10,
      width: isActive ? 12 : 10,
      decoration: BoxDecoration(
          color: isActive ? ColorsRes.white : ColorsRes.white.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  openNotificationDialog() {
    showNewDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Notification"),
          content: Text(StringsRes.introdialogmsg),
          actions: [
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
