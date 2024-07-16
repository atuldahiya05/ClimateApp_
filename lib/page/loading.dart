import 'package:flutter/material.dart';
import 'package:mosam/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loading extends StatefulWidget {
  
  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  var city = "Delhi";
  var temp;
  var humidity;
  var air_speed;
  var climate;
  var icon;
   void get_data ()async{
    Worker a = Worker("$city");
    await a.getdata();
    temp = a.temp.toString().substring(0,4);
    humidity = a.humidity.toString();
    air_speed = a.air_speed.toString().substring(0,4);
    climate = a.climate.toString();
    icon= a.icon.toString();


     Future.delayed(Duration(seconds: 4),(){
       Navigator.pushReplacementNamed(context, '/home',arguments: {
         'temp_' : temp,
         "humidity_" : humidity,
         "air_speed_" : air_speed,
         "climate" : climate,
         "icon": icon,
         "city_i" : city
       },);

     });
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    get_data();
  }
  @override
  Widget build(BuildContext context) {
    // Map<String,dynamic>? infor = ModalRoute.of(context)?.settings.arguments as Map <String,dynamic>?;
    // if(infor?.isNotEmpty ?? false){
    //     city = infor?['search'];
    // }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center (
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Column(
            children: <Widget> [
              Image.asset("items/icon.png",height: 300,width: 300,),

              const Text("Mausam Bata"
                  "",style: TextStyle(
                fontSize: 30,fontWeight:FontWeight.bold ,color:  Colors.white
              ),),
              const Text("Made by Atul",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white
              ),),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: SpinKitSpinningLines(
              color: Colors.white,
              size: 60.0,
            ),
          ),
            ],
          ),
        ),
      ) ,
      backgroundColor: Colors.blueAccent,
    );
  }
}