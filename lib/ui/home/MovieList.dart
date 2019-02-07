import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:the_movie/Theme.dart' as Theme;
import 'package:http/http.dart' as http;
import 'package:the_movie/conf/TheMovieDb.dart';
import 'package:the_movie/model/Movie.dart';
import 'package:the_movie/ui/home/HomeRow.dart';


class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => new _MovieListState();
}

class _MovieListState extends State<MovieList> {

  List dataList;

  Future<String> getData() async{
    http.Response response = await http.get(
      Uri.encodeFull(
          "${TheMovieDb.baseUrl}popular?api_key=${TheMovieDb.apiKey}"),
      headers: {"Accept": "application/json"}
    );

    this.setState((){
      Map data = jsonDecode(response.body);
      dataList = data['results'];
      print(dataList);
    });

    return "Success!";
  }


  @override
  Future initState() async {
    super.initState();
    await getData();
  }

  @override
  Widget build(BuildContext context) {

    return new Flexible(
        child: new Container(
          color: Theme.Colors.moviePageBackground,
          child: new RefreshIndicator(
              child: new ListView.builder(
                  itemCount: dataList == null ? 0 : dataList.length,
                  itemBuilder: _itemBuilder
              ),
              onRefresh: _onRefresh
          )
        )
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {

    Movie movie = getMovie(dataList[index]["id"].toString(), dataList[index]["title"], dataList[index]["overview"], dataList[index]["poster_path"], dataList[index]["backdrop_path"] , dataList[index]["vote_average"].toString());

    return new HomeRow(movie);
  }

  Future<dynamic> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    });

    return completer.future;
  }

  Movie getMovie(String id, String title, String overview, String pathUrl, String backdropUrl, String star){
    return new Movie(id: id, title: title, overview: overview, pathUrl: pathUrl, backdropUrl: backdropUrl, star: star);
  }
}
