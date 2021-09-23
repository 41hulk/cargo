import 'package:cargo/dashboard/cargotrack.dart';
import 'package:cargo/dashboard/order.dart';
import 'package:cargo/profile/profileScreen.dart';
import 'package:cargo/utils/colors.dart';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashboardScreen> {
  late PageController _myPage;
  int _selectedPage = 0;

  List<Widget> pages = [
    OrderScreen(),
    TrackScreen(),
    Center(child: Text("2")),
    UserProfileScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _myPage.jumpToPage(index);
    });
  }

  @override
  void initState() {
    _myPage = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cargoBlue,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Capstone Logistics',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.account_circle, color: Colors.white),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         CupertinoPageRoute(
          //           builder: (context) => UserProfileScreen(),
          //         ),
          //       );
          //     },
          //   ),
          // ],
        ),
        body: PageView(
          controller: _myPage,
          children: [...pages],
        ),
        bottomNavigationBar: FlashyTabBar(
          selectedIndex: _selectedPage,
          showElevation: true,
          // onItemSelected: (index) => setState(() {
          //   _selectedIndex = index;
          // }),
          onItemSelected: (index) => _onItemTapped(index),
          items: [
            FlashyTabBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 25,
                color: cargoGreen,
              ),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.art_track,
                size: 25,
                color: cargoGreen,
              ),
              title: Text('Cargo Track'),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.add_road,
                size: 25,
                color: cargoGreen,
              ),
              title: Text('Cargo Update'),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 25,
                color: cargoGreen,
              ),
              title: Text('Profile'),
            ),
          ],
        ));
  }
}
