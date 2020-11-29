import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lost_dogs/tabs/not_available.dart';

import 'tabs/main_tab.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  /// for drawer menu
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  /// Tabs
  int _currentIndex = 0;

  final List<Widget> _tabWidgets = <Widget>[
    MainTab(),
    NotAvailable(),
    NotAvailable(),
    NotAvailable(),


  ];


  void _onTap(int val, BuildContext context) {
    setState(() {
      _currentIndex = val;
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: _tabWidgets.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          onTap: (val) => _onTap(val, context),
          items: [
            // Main Page
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/bottom_icons/home.png"),size: 25,),
              title: Padding(
                padding: EdgeInsets.only(top: 3.0, bottom :0 ),
                child: null,
              ),
            ),
            // Not Available
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/bottom_icons/search.png"),size: 25,),
              title: Padding(
                padding: EdgeInsets.only(top: 3.0, bottom :0 ),
                child: null,
              ),
            ),
            // Not Available
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/bottom_icons/favorites.png"),size: 25,),
              title: Padding(
                padding: EdgeInsets.only(top: 3.0, bottom :0 ),
                child: null,
              ),
            ),
            // Not Available
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/bottom_icons/popular.png"),size: 25,),
              title: Padding(
                padding: EdgeInsets.only(top: 3.0, bottom :0 ),
                child: null,
              ),
            ),
            // Profile
          ],
        ),
      ),
    );
  }


}