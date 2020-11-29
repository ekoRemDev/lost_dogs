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