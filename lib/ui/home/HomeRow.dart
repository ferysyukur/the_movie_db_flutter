import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/Routes.dart';
import 'package:the_movie/conf/TheMovieDb.dart';
import 'package:the_movie/model/Movie.dart';
import 'package:the_movie/Theme.dart' as Theme;

class HomeRow extends StatefulWidget {

  final Movie movie;

  HomeRow(this.movie);

  @override
  HomeRowState createState() {
    return new HomeRowState();
  }
}

class HomeRowState extends State<HomeRow> {
  BuildContext mContext;

  @override
  Widget build(BuildContext context) {

    mContext = context;

    final movieThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 7.0),
      child: new Hero(
          tag: 'movie-img-${widget.movie.id}',
          child: new Container(
            decoration: new BoxDecoration(
              border: new Border.all(
                width: 2.0,
                color: Theme.Colors.movieBorder
              )
            ),
            child: new Image.network(
              TheMovieDb.baseImageUrl+widget.movie.pathUrl,
              height: 125.0,
            ),
          )
      ),
    );

    final movieCard = new Container(
      margin: const EdgeInsets.only(left: 45.0, right: 7.0),
      height: 250.0,
      decoration: new BoxDecoration(
        color: Theme.Colors.movieCard,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(4.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            offset: new Offset(0.0, 8.0)
          )
        ]
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 55.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(widget.movie.title,style: Theme.TextStyles.movieTitle,),
            new Padding(
                padding: new EdgeInsets.only(top: 5.0, right: 7.0),
                child: new Text(
                  widget.movie.overview,
                  textAlign: TextAlign.justify,
                  maxLines: 4,
                  style: Theme.TextStyles.movieLocation,),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 5.0),
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.star,
                    size: 15.0,
                    color: Theme.Colors.appBarGradientEnd,
                  ),
                  new Text(" "+widget.movie.star,
                    style: Theme.TextStyles.movieLocation,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    return new Container(
      height: 150.0,
      margin: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: new FlatButton(
          onPressed: _navigate,
          child: new Stack(
            children: <Widget>[
              movieCard,
              movieThumbnail
            ],
          )
      ),
    );
  }

  _navigate() async {
    Routes.navigateTo(mContext,
        '/detail/${widget.movie.id}',
      transition: TransitionType.fadeIn
    );
//    prefs = await SharedPreferences.getInstance();
//    String getMovie = prefs.getString('movie');
//    print("Movie get: ${getMovie == null ? "kosong" : getMovie}");
//    prefs.setString('movie', movie.title);
  }
}


