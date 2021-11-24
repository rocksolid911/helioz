import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class myDrawer extends StatelessWidget {

  const myDrawer({
    Key?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    List<ListTile> _listdata = <ListTile>[
      ListTile(
        leading: Image.asset(
          "assets/helioz-menu-icons/dashboard.png",
          height: 50,
          width: 50,
        ),
        title:  Text('Dashboard',style: TextStyle(fontSize: 13.sp,color: const Color(0xFF5B81E8)),),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/dashboard');
        },
      ),
      ListTile(
        leading: Image.asset(
          "assets/helioz-menu-icons/pre-registration.png",
          height: 50,
          width: 50,
        ),
        //title: Text('TimeTable_Teacher'),
        title:  Text("Pre-Registration",style: TextStyle(fontSize: 13.sp,color: const Color(0xFF5B81E8)),),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/pre-reg');
        },
      ),
      ListTile(
        leading: Image.asset(
          "assets/helioz-menu-icons/registration-distribution.png",
          height: 50,
          width: 50,
        ),
        //title: Text('TimeTable_Teacher'),
        title: Text("Registration",style: TextStyle(fontSize: 13.sp,color: const Color(0xFF5B81E8)),),
        onTap: () {
          Navigator.pop(context);
         Navigator.pushNamed(context, "/reg");
        },
      ),
      ListTile(
        leading: Image.asset(
          "assets/helioz-menu-icons/monitoring.png",
          height: 50,
          width: 50,
        ),
        title: Text('Monitoring',style: TextStyle(fontSize: 13.sp,color: const Color(0xFF5B81E8)),),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/assignment_teacher_main');
        },
      ),
      ListTile(
        leading: Image.asset(
          "assets/helioz-menu-icons/list.png",
          height: 50,
          width: 50,
        ),
        title:  Text('List',style: TextStyle(fontSize: 13.sp,color: const Color(0xFF5B81E8)),),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/list');
        },
      ),
      ListTile(
        leading: Image.asset(
          "assets/helioz-menu-icons/preference.png",
          height: 50,
          width: 50,
        ),
        title:  Text('Preference',style: TextStyle(fontSize: 13.sp,color: const Color(0xFF5B81E8)),),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/circular');
        },
      ),

      ListTile(
        leading: Image.asset(
          "assets/helioz-menu-icons/help.png",
          height: 50,
          width: 50,
        ),
        title:  Text('Help',style: TextStyle(fontSize: 13.sp,color: const Color(0xFF5B81E8)),),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, "/assmain");
        },
      ),
      ListTile(
        leading: Image.asset(
          "assets/helioz-menu-icons/logout.png",
          height: 50,
          width: 50,
        ),
        title:  Text('Logout',style: TextStyle(fontSize: 13.sp,color: const Color(0xFF5B81E8)),),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, "/login");
        },
      ),

    ];
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 135,
              width: double.infinity,
             color: Color(0xFF5B81E8),
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    const CircleAvatar(
                      //backgroundColor: Colors.pinkAccent,
                      radius: 35,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
                        // height: (13),
                        // width: (13),
                        //fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("Naina Saini",style: TextStyle(fontSize: 14.sp,color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              height: 71.h,
              width: double.infinity,
             // color: Colors.green,
              child: ListView.builder(
                itemCount: _listdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: _listdata[index].leading,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: _listdata[index].title,
                    ),
                    onTap: _listdata[index].onTap,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
