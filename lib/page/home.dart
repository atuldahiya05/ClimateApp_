import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:http/http.dart';
class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  TextEditingController search_ = new TextEditingController();
  @override
  void initState(){
    super.initState();
  }
  @override
  void setState(fn) {
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    Map<String,dynamic>? info = ModalRoute.of(context)?.settings.arguments as Map <String,dynamic>?;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.lightBlueAccent,),
      ),
      body:  SafeArea(
            child: Container (
              height: h,
              width: w,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.orangeAccent,
                    Colors.lightBlueAccent,
                  ]
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container( // search baar ka container
                      padding: const EdgeInsets.all(1),
                      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              // if((search_.text).replaceAll(" ", "") == ""){
                              //
                              // }else{Navigator.pushReplacementNamed(context, '/',arguments: {
                              //   "search":search_.text,
                              // });}
                            },
                            child:   Container(child: Icon(Icons.search),margin: EdgeInsets.only(left: 8, right: 7),),
                          ),
                          Expanded(child:
                            TextField(
                              controller: search_,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search a location"
                              ) ,
                            ),
                            )
                        ],
                      ),
                    ),
                        
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white.withOpacity(0.5)),
                              margin: EdgeInsets.symmetric(horizontal: 25),
                              padding: EdgeInsets.all(10),
                              child: Row(children: [
                                Image.network("http://openweathermap.org/img/wn/${info?['icon']}@2x.png"),
                                SizedBox(width: 20,),
                                Column(
                                  children: [
                                    Text("${info?['climate']}",style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Text("In ${info?['city_i']}",style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),)
                                  ],
                                )
                              ])),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white.withOpacity(0.5)),
                            margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                            padding: EdgeInsets.all(26),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.thermometer),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Row(
                        
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${info?['temp_']}",style: TextStyle(
                        
                                          fontSize: 80
                                      ),),
                                      Text("C",style: TextStyle(
                                          fontSize: 50
                                      ),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white.withOpacity(0.5)),
                            margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                            padding: EdgeInsets.all(26),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(WeatherIcons.wind)
                                  ],
                                ),
                                SizedBox(height: 30,)
                                ,
                                Text("${info?['air_speed_']}",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text("km/hr")
                              ],
                            ),
                            height: 200,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white.withOpacity(0.5)),
                            margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                            padding: EdgeInsets.all(26),
                            height: 200,
                            child:  Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(WeatherIcons.humidity)
                                  ],
                                ),
                                SizedBox(height: 30,)
                                ,
                                Text("${info?['humidity_']}",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text("Percent")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60,),
                    Column(
                      children: [
                        Container(
                          child: Text("Made by Atul" , style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}