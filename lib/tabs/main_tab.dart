import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lost_dogs/dog_detail.dart';
import 'package:lost_dogs/mixins/mixin_functions.dart';
import 'package:lost_dogs/models/dog.dart';
import 'dart:convert' show json;
import 'package:lost_dogs/widget/widgets.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with MixinFunctions{

  List dogsListFromApi = []; // keeps response from api
  List dogsList = []; // keeps data for ui

  bool _isDataLoaded = false;

  Future<void> _getDogList() async {

    String jsonString = await rootBundle.loadString('assets/dogs.json');
    dogsListFromApi = json.decode(jsonString)["dogs"];

    print(dogsListFromApi.length);



    for (int i = 0; i < dogsListFromApi.length; i++) {

      Dog dog = new Dog.fromJson(dogsListFromApi[i]);

      // print(dog);
      // print(dogsListFromApi[i]['breed']);


      dogsList.add({
        "breed" : dog.breed,
        "gender" : dog.gender,
        "color" : dog.color,
        "location" : dog.location,
        "imageUrl" : dog.imageUrl,
        "description" : dog.description,
      });
    }

    setState(() {
      _isDataLoaded = true;
    });
  }


  @override
  void initState() {
    super.initState();
    _getDogList();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        pageBackgroundColor(),

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
                      child: toolbarTitle("Find My Pet"),),

                    // Button
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

              SizedBox(height: MediaQuery.of(context).size.height * 0.056,),

              /// Dogs List
              Container(
                height: MediaQuery.of(context).size.height * 0.70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius:
                  BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                  ),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text("Animales Perdidos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.63,
                      child:
                      _isDataLoaded
                        ? ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: dogsList == null ? 0 : dogsList.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.80,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                  ),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Row(
                                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                  children: [


                                    GestureDetector(
                                      onTap : (){

                                        Navigator.push(context,MaterialPageRoute(builder: (context) => DogDetail(dogIndex: index ,)));

                                      },
                                      child: Container(
                                        height: 200,
                                        width: MediaQuery.of(context).size.width * 0.45,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                            bottomRight: Radius.circular(25),
                                            bottomLeft: Radius.circular(25),
                                          ),
                                          border: Border.all(color: Colors.white),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(25),
                                          ),
                                          // child: FadeInImage.assetNetwork(
                                          //   placeholder: 'assets/loading.gif',
                                          //   image: dogsList[index]['imageUrl'],
                                          //   fit: BoxFit.cover,
                                          // ),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context).size.width,
                                            // height: 250,
                                            imageUrl: dogsList[index]['imageUrl'],
                                            placeholder: (context, url) => CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 5,),

                                    Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(25),
                                          bottomRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(0),
                                        ),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap : (){
                                                  showToastMessages("Not in this version");
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top : 5, right : 10.0),
                                                  child: FaIcon(FontAwesomeIcons.heart,size: 14,color: Colors.grey[300], ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 5,),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(dogsList[index]['breed'], style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),),
                                            ],
                                          ),

                                          SizedBox(height: 10,),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(dogsList[index]['location'], style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),),
                                            ],
                                          ),

                                          Text(dogsList[index]['description'], textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );
                          })
                      : Container(child: Text("Error Getting Data"),),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ],
    );
  }
}