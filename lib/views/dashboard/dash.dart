import 'package:cargo/utils/colors.dart';
import 'package:cargo/views/dashboard/cargotrack.dart';
import 'package:cargo/views/dashboard/order.dart';
import 'package:cargo/views/dashboard/update.dart';
import 'package:cargo/views/profile/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

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
    UpdateScreen(),
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
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _myPage,
          children: [...pages],
        ),
        bottomNavigationBar: SlidingClippedNavBar(
          selectedIndex: _selectedPage,
          activeColor: Color(0xFF01579B),
          iconSize: 26,
          onButtonPressed: (index) => _onItemTapped(index),
          barItems: [
            BarItem(
              icon: Icons.home_outlined,
              title: 'Home',
            ),
            BarItem(
              icon: Icons.art_track,
              title: 'Track',
            ),
            BarItem(
              icon: Icons.add_road,
              title: 'Update',
            ),
            BarItem(
              icon: Icons.account_circle,
              title: 'Profile',
            ),
          ],
        ));
  }
}
