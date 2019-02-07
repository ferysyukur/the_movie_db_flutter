import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:the_movie/Theme.dart' as Theme;
import 'package:the_movie/conf/TheMovieDb.dart';
import 'package:the_movie/model/Genres.dart';
import 'package:the_movie/model/MovieDetail.dart';
import 'package:the_movie/ui/movie_detail/MovieDetailWidget.dart';

 class MovieDetailPage extends StatefulWidget {

   final String id;

   MovieDetailPage(this.id);

   @override
   _MovieDetailPageState createState() {
     return new _MovieDetailPageState();
   }
 }
 
 class _MovieDetailPageState extends State<MovieDetailPage> {

   String url;

   MovieDetail movieDetail;

   Future<http.Response> _response;

   void _refresh(){
     url = "${TheMovieDb.baseUrl}${widget.id}?api_key=${TheMovieDb.apiKey}";
     setState((){
       _response = http.get(url);
     });
   }


   @override
   void initState() async {
     super.initState();
     _refresh();
   }

   @override
   void dispose() {
     super.dispose();
   }

   @override
   Widget build(BuildContext context) {

     final progressBar = new Container(
       color: Theme.Colors.moviePageBackground,
       child: new Center(
         child: new CircularProgressIndicator(),
       ),
     );

     return new FutureBuilder(
       future: _response,
       builder: (BuildContext context, AsyncSnapshot<http.Response> response) {
         if (!response.hasData) {
           return progressBar;
         } else {
           Map<String, dynamic> map = jsonDecode(response.data.body);
           movieDetail = getMovieDetail(
               map['id'].toString(),
               map['title'],
               map['overview'],
               map['poster_path'],
               map['vote_average'].toString(),
               map['backdrop_path'],
               map['homepage'],
               map['popularity'].toString(),
               map['tagline'],
               map['genres']);
           return new Scaffold(
             body: new MovieDetailWidget(movieDetail),
           );
         }
       }
     );
  }

  MovieDetail getMovieDetail(String id, String title, String overview, String pathUrl, String star, String backdropUrl, String homepage, String popularity, String tagline, List<Genres> genres){
     return new MovieDetail(id, title, overview, pathUrl, star, backdropUrl, homepage, popularity, tagline, genres);
  }
}
 