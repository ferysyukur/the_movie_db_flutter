import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/ui/movie_detail/MovieDetailPage.dart';


class Routes{
  static final Router _router = new Router();

  static var movieDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params){
      return new MovieDetailPage(params['id']);
    }
  );
  
  static void initRoutes(){
    _router.define('/detail/:id', handler: movieDetailHandler);
  }

  static void navigateTo(context, String route, {TransitionType transition}){
    _router.navigateTo(context, route, transition: transition);
  }
}