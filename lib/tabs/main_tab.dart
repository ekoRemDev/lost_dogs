import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:lost_dogs/mixins/mixin_functions.dart';
import 'dart:convert' show json;

import 'package:lost_dogs/widget/widgets.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with MixinFunctions{

  List celebrityListFromApi = []; // keeps response from api
  List celebrityList = []; // keeps data for ui


  ScrollController _scrollController = new ScrollController();



  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        pageBackgroundColor(),

        Padding(
          padding: EdgeInsets.only(
            top : MediaQuery.of(context).size.height * 0.04,
            bottom : MediaQuery.of(context).size.height * 0.00,
          ),
          child: Column(

            children: <Widget>[

              // Header
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[


                    SizedBox(width: 20,),

                    // Drawer Menu
                    Container(
                      width: MediaQuery.of(context).size.width * 0.10,
                      child: InkWell(
                        onTap: () {
                          showToastMessages("Not in this version");
                        },
                        child: toolbarButtonsMenu(),
                      ),),


                    // Page Title
                    Container(width: MediaQuery.of(context).size.width * 0.53,
                      child: SizedBox(),),

                    // Notification Button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: InkWell(
                        onTap: () {
                          //do Something
                          },
                        highlightColor: Colors.white.withOpacity(0.9),
                        child: toolbarButtonsNotification(),
                      ),
                    ),

                  ],
                ),
              ),




              /// Dogs List
              Container(
                height: MediaQuery.of(context).size.height * 0.652,
                width: MediaQuery.of(context).size.width,
                child:  ListView.builder(

                  controller: _scrollController,
                    padding: EdgeInsets.only(top: 0),
                    // separatorBuilder: (context,index){
                    //   return SizedBox(height: 1.0);
                    // },
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: celebrityList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[

                              Row(
                                // mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                children: [


                                  /// image
                                  InkWell(
                                    onTap: (){
                                      // Go to dog details
                                      },
                                    child: SizedBox(
                                      width : MediaQuery.of(context).size.width * 0.20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CircleAvatar(
                                          radius: 25,
                                          child: ClipOval(
                                            child: CachedNetworkImage(
                                              imageUrl: "https://images.dog.ceo/breeds/terrier-silky/n02097658_2173.jpg",
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget: (context, url, error) =>
                                                  Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  /// text fields
                                  SizedBox(
                                    width : MediaQuery.of(context).size.width * 0.55,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              celebrityList[index]['name'] ,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xff643E4C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),


                                        SizedBox(width: 30,),


                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              celebrityList[index]['position'] ,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xff643E4C),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300),
                                            ),

                                            SizedBox(width: 8,),


                                            Text(
                                              celebrityList[index]['followerCount'].toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xff643E4C),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(width: 8,),


                                          ],
                                        ),

                                      ],
                                    ),
                                  ),



                              ],
                              ),



                            ],
                          ),
                        ),
                      );
                    }),
              )










            ],
          ),
        ),
      ],
    );
  }
}
