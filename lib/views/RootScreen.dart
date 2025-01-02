import 'package:flutter/material.dart';
import 'package:sappat_v1_flutter/constants/constants.dart';
import 'package:sappat_v1_flutter/views/DashboardScreen.dart';
import 'package:sappat_v1_flutter/views/LoginScreen.dart';
import 'package:sappat_v1_flutter/views/ReportMgtScreen.dart';
import 'package:sappat_v1_flutter/views/SplashScreen.dart';
import 'package:sappat_v1_flutter/views/SearchScreen.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:sappat_v1_flutter/views/VcmgtScreen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _bottomNavIndex = 0;

  List<Widget> pages = const [
    DashboardScreen(),
    SearchScreen(),
    VcmgtScreen(),
    ReportmgtScreen()
  ];

  List<IconData> icons = [
    Icons.dashboard,
    Icons.search,
    Icons.link,
    Icons.notes
  ];

  List<String> labels = const [
    'Overview',
    'Search',
    'Value Chain Data Management',
    'Report Management',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
              title: Text(labels[_bottomNavIndex], style: pageTitle),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              scrolledUnderElevation: 0,
              shadowColor: Colors.black)),
      body: IndexedStack(index: _bottomNavIndex, children: pages),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Colors.blue,
        activeColor: Colors.blue,
        inactiveColor: Colors.black,
        activeIndex: _bottomNavIndex,
        icons: icons,
        leftCornerRadius: 25, // Top left corner radius
        rightCornerRadius: 25, // Top right corner radius
        blurEffect: true,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.none,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
