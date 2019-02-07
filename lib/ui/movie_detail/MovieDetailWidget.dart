import 'package:flutter/material.dart';
import 'package:the_movie/conf/TheMovieDb.dart';
import 'package:the_movie/model/MovieDetail.dart';
import 'package:the_movie/Theme.dart' as Theme;
import 'package:the_movie/ui/movie_detail/DetailAppBar.dart';
import 'package:url_launcher/url_launcher.dart';


class MovieDetailWidget extends StatefulWidget {

  final MovieDetail movieDetail;

  MovieDetailWidget(this.movieDetail);

  @override
  MovieDetailWidgetState createState() {
    return new MovieDetailWidgetState();
  }
}

class MovieDetailWidgetState extends State<MovieDetailWidget> {
  List genres;

  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    
    mContext = context;

    var matchParent = MediaQuery.of(context).size.width;
    var heightBar = MediaQuery.of(context).padding.top;

    genres = widget.movieDetail.genres;

    print(widget.movieDetail.backdropUrl);

    var centerPoster = (matchParent-100)/2;

    final contentDetail = new Container(
      margin: new EdgeInsets.only(top: 200.0, left: 35.0, right: 35.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 250.0,
            decoration: new BoxDecoration(
                color: Theme.Colors.movieBorder,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                      offset: new Offset(0.0, 8.0)
                  ),
                ]
            ),
            child: new Column(
//              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(top: 110.0, left: 10.0, right: 10.0),
                  child: new Center(
                    child: new Text(widget.movieDetail.title,
                      style: Theme.TextStyles.movieTitle,
                    ),
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                  child: new Center(
                    child: new Text("${widget.movieDetail.tagline}",
                      style: Theme.TextStyles.movieTagline,
                    ),
                  ),
                ),
                widget.movieDetail.homepage != null ?
                new Container(
                  margin: new EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                  child: new Center(
                    child: new GestureDetector(
                      onTap: _homepageClick,
                      child: new Text("${widget.movieDetail.homepage}",
                        style: Theme.TextStyles.movieTagline,
                      ),
                    ),
                  ),
                ) : null,
                new Container(
                  margin: new EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: new Icon(Icons.star,
                          color: Theme.Colors.appBarGradientEnd,
                        ),
                      ),
                      new Container(
                        margin: new EdgeInsets.only(left: 5.0),
                        child: new Text(widget.movieDetail.star,
                          style: Theme.TextStyles.movieTitle,
                        ),
                      ),
                      new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        child: new Icon(Icons.watch_later,
                          color: Theme.Colors.appBarGradientEnd,
                        ),
                      ),
                      new Container(
                        margin: new EdgeInsets.only(left: 5.0),
                        child: new Text(widget.movieDetail.popularity,
                          style: Theme.TextStyles.movieTitle,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 15.0),
            child: new Text("GENRES",
              textAlign: TextAlign.left,
              style: Theme.TextStyles.movieOverviewDetailTitle,
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 5.0),
            child: new SizedBox.fromSize(
              size: const Size.fromHeight(50.0),
              child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genres == null ? 0 : genres.length,
                  itemBuilder: _buildGenres
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 15.0),
            child: new Text("OVERVIEW",
              textAlign: TextAlign.left,
              style: Theme.TextStyles.movieOverviewDetailTitle,
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 10.0),
            child: new Text(widget.movieDetail.overview,
              textAlign: TextAlign.justify,
              style: Theme.TextStyles.movieOverviewDetail,
            ),
          )
        ],
      ),
    );

    return new Container(
      color: Theme.Colors.moviePageBackground,
      height: MediaQuery.of(context).size.height,
      child: new SingleChildScrollView(
        child: new Stack(
          children: <Widget>[
            new ClipPath(
              clipper: new ArcClipper(),
              child: new Image.network(TheMovieDb.baseImageUrl+widget.movieDetail.backdropUrl,
                width: matchParent,
                fit: BoxFit.cover,
              ),
            ),
            new DetailAppBar(),
            contentDetail,
            new Container(
              margin: new EdgeInsets.only(top: centerPoster),
              child: new Column(
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(
                            width: 3.0,
                            color: Theme.Colors.movieBorder
                        )
                    ),
                    margin: new EdgeInsets.symmetric(horizontal: centerPoster),
                    child: new Hero(
                        tag: 'movie-img-${widget.movieDetail.id}',
                        child: new Image.network("https://image.tmdb.org/t/p/w500"+widget.movieDetail.pathUrl,
                          width: 100.0,
                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _buildGenres(BuildContext context, int index) {
    print(genres[index]["name"]);
    return new Chip(
        label: new Text(genres[index]["name"],
          style: Theme.TextStyles.movieGenres,
        ),
      backgroundColor: Theme.Colors.movieTitle,
    );
  }

  _homepageClick() async {
    String url = widget.movieDetail.homepage;

    print("tap: $url");

    if(await canLaunch(url)){
      await launch(url);
    }else{
      Scaffold.of(mContext).showSnackBar(
        new SnackBar(content: new Text("Could not launch $url"))
      );
//      throw 'Could not launch ${url}';
    }
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = new Offset(size.width / 4, size.height);
    var firstPoint = new Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint =
    new Offset(size.width - (size.width / 4), size.height);
    var secondPoint = new Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
