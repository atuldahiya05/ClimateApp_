import 'package:flutter/material.dart';
import 'package:mosam/page/home.dart';
import 'package:mosam/page/loading.dart';
import 'package:mosam/page/location.dart';
void main() {
  runApp(MaterialApp(
    
    routes: {
      "/home" :(context) => home(),
      "/location" :(context) => location(),
      "/":(context) => loading(),
    },
  ));
}
