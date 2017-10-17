import 'package:the_movie/model/Genres.dart';

class MovieDetail{

  String id;
  String title;
  String overview;
  String pathUrl;
  String star;
  String backdropUrl;
  String homepage;
  String popularity;
  String tagline;
  List<Genres> genres;

  MovieDetail(this.id, this.title, this.overview, this.pathUrl, this.star, this.backdropUrl, this.homepage, this.popularity, this.tagline, this.genres);
}