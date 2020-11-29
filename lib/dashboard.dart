import 'dart:ui';
import 'package:celebrity_flutter_app/tabs/favorites_tab.dart';
import 'package:celebrity_flutter_app/tabs/profile_tab.dart';
import 'package:celebrity_flutter_app/tabs/search_tab.dart';
import 'package:celebrity_flutter_app/tabs/top_celebrity_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'config/config_color.dart';
import 'config/mixin_functions.dart';
import 'tabs/main_tab.dart';
import 'widgets/widgets.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with MixinFunctions {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _currentIndex = 0;


  final List<Widget> _tabWidgets = <Widget>[
    MainTab(),
    SearchTab(),
    FavoritesTab(),
    TopCelebrityTab(),
    ProfileTab()

  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WillPopScope(
        onWillPop: doubleTapToQuit,
        child: Scaffold(
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
                // home
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/bottom_icons/home.png"),size: 25,),
                  title: Padding(
                    padding: EdgeInsets.only(top: 3.0, bottom :0 ),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                // Search
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/bottom_icons/search.png"),size: 25,),
                  title: Padding(
                    padding: EdgeInsets.only(top: 3.0, bottom :0 ),
                    child: Text(
                      "Search",
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                // Favourites
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/bottom_icons/favorites.png"),size: 25,),
                  title: Padding(
                    padding: EdgeInsets.only(top: 3.0, bottom :0 ),
                    child: Text(
                      "Favourites",
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                // Top Celebrity
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/bottom_icons/celebrity.png"),size: 25,),
                  title: Padding(
                    padding: EdgeInsets.only(top: 3.0, bottom :0 ),
                    child: Text(
                      "Top Celebrity",
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                // Profile
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/bottom_icons/home.png"),size: 25,),
                  title: Padding(
                    padding: EdgeInsets.only(top: 3.0, bottom :0 ),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _onTap(int val, BuildContext context) {
    setState(() {
      _currentIndex = val;
    });
  }



}