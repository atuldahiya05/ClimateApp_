import 'package:http/http.dart';
import 'dart:convert';


class Worker{
  var location;
  Worker (this.location){
    location = this.location;
  }

  var temp ;
  var humidity;
  var air_speed;
  var discription;
  var climate;
  var icon;

  // method
  Future <void> getdata() async
  {
    try{
      Response res = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=b553124d2b53e71a3f470b4e6d7d0533"));
      Map data=jsonDecode(res.body);

      Map main_data = data['main'];
      List weather_data = data['weather'];
      Map main_weather = weather_data[0];
      Map get_wind = data['wind'];

      var get_temp = main_data['temp']-273.15;
      var get_humidity = main_data['humidity'];
      var get_icon = main_weather['icon'];
      var get_speed = get_wind['speed']*3.6;
      var get_climate = main_weather['description'];


      humidity = get_humidity;
      temp = get_temp;
      air_speed = get_speed;
      icon = get_icon;
      climate = get_climate;
    }
    catch(e){
      humidity = "error";
      temp = "error";
      air_speed = "NA";
      icon = "0";
      climate = "c";
    }
  }
}