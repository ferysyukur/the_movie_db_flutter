import 'package:the_movie/Theme.dart' as Theme;
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final double barHeight = 66.0;
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return new Container(
//      color: Theme.Colors.appBarDetailBackground,
      padding: new EdgeInsets.only(
          top: statusbarHeight
      ),
      height: barHeight+statusbarHeight,
      child: new Row(
        children: <Widget>[
          new BackButton(
              color: Theme.Colors.appBarIconColor
          ),
          new SimpleDialogOption()
        ],
      ),
    );
  }
}
