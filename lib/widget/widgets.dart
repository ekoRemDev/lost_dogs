import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Widget pageBackgroundColor() {
  return Container(
    decoration: new BoxDecoration(
      color: Colors.blue,
    ),
  );
}

Widget toolbarButtonsMenu(){
  return Center(
      child: FaIcon(FontAwesomeIcons.bars,size: 30,color: Colors.white, ),
  );

}

Widget toolbarButtonsNotification(){
  return Center(
    child: FaIcon(FontAwesomeIcons.locationArrow,size: 24,color: Colors.white, ),
  );
}

Widget toolbarTitle(String title){
  return Text(
    title,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 24, color: Colors.white),);
}


Widget toolbarButtonsBack(){

  return Center(
    child: FaIcon(FontAwesomeIcons.angleLeft,size: 30,color: Colors.white, ),
  );

}