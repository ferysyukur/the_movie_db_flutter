import 'package:flutter/material.dart';
import 'package:the_movie/ui/home/GradientAppBar.dart';
import 'package:the_movie/ui/home/MovieList.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => new _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new GradientAppBar("Movie"),
        new MovieList()
      ],
    );
  }
}
