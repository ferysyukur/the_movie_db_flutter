import 'package:flutter/material.dart';
import 'package:the_movie/Routes.dart';
import 'package:the_movie/ui/home/HomePage.dart';

void main(){
  Routes.initRoutes();
  runApp(new MaterialApp(
    title: "The Moive",
    home: new HomePage(),
  ));
}