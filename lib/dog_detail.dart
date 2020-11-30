import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lost_dogs/models/dog.dart';
import 'package:lost_dogs/mixins/mixin_functions.dart';
import 'dart:convert' show json;

import 'package:lost_dogs/widget/widgets.dart';

class DogDetail extends StatefulWidget {

  int dogIndex;

  DogDetail({this.dogIndex});


  @override
  _DogDetailState createState() => _DogDetailState();
}

class _DogDetailState extends State<DogDetail> with MixinFunctions{

  Map dogFromApi = {}; // keeps response from api
  List dogDetail = []; // keeps data for ui

  String _breed = "";
  String _gender = "";
  String _color = "";
  String _location = "";
  String _imageUrl = "";
  String _description = "";



  Future<void> _getDogDetail(int index) async {

    String jsonString = await rootBundle.loadString('assets/dogs.json');
    dogFromApi = json.decode(jsonString)["dogs"][index];


    Dog dog = new Dog.fromJson(dogFromApi);


    setState(() {
      _breed = dog.breed;
      _gender = dog.gender;
      _color = dog.color;
      _location = dog.location;
      _imageUrl = dog.imageUrl;
      _description = dog.description;

    });


  }

  @override
  void initState() {
    super.initState();
    _getDogDetail(widget.dogIndex);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Stack(
        children: <Widget>[


          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/loading.gif',
              image: _imageUrl,
              fit: BoxFit.fill,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top : MediaQuery.of(context).size.height * 0.05,
              bottom : MediaQuery.of(context).size.height * 0.00,
            ),
            child: Column(

              children: <Widget>[


                // Header
                Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,

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
                            Navigator.of(context).pop();
                          },
                          child: toolbarButtonsBack(),
                        ),),


                      // Page Title
                      Container(width: MediaQuery.of(context).size.width * 0.53,
                        child: toolbarTitle("Find My Pet"),),

                      // Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20,
                      ),

                    ],
                  ),
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.35,),



                /// Dog Detail

                Stack(
                  children: [

                    /// detail
                    Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius:
                            BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                            ),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:
                                      BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Sexo", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.grey[700]),),
                                        Text(_gender, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey[700]),),
                                      ],
                                    ),
                                  ),

                                  SizedBox(width: 25,),

                                  Container(
                                    width: 120,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:
                                      BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Color", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.grey[700]),),
                                        Text(_color, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey[700]),),
                                      ],
                                    ),
                                  )

                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                              Padding(
                                padding: const EdgeInsets.only(left : 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Ubicación :", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.grey[700]),),
                                    Text(_location, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.grey[700]),),

                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                              Padding(
                                padding: const EdgeInsets.only(left : 16.0, right: 16),
                                child: Text(_description, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey[700]),),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                              ButtonTheme(
                                height: 50,
                                highlightColor: Colors.blue,
                                splashColor: Colors.amber,
                                minWidth: MediaQuery.of(context).size.width * 0.80,
                                child: RaisedButton(
                                  elevation: 2,
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.white.withOpacity(0.3))),
                                  onPressed: (){

                                  },
                                  child: Text(
                                    "Contactor",
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.w600),),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),

                    /// title
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width * 0.70,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius:
                          BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          // border: Border.all(color: Colors.grey),
                        ),
                        child: Center(child: Text(_breed, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),)),
                      ),
                    ),
                  ],
                )



              ],
            ),
          ),
        ],
      ),
    );
  }
}