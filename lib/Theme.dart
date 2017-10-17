import 'package:flutter/material.dart';

class Colors{

  const Colors();

  static const Color appBarTitle = const Color(0xFFFFFFFF);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x160E7C7B);
  static const Color appBarGradientStart = const Color(0xFFE60000);
  static const Color appBarGradientEnd = const Color(0xFFD62246);
  
  static const Color movieCard = const Color(0xFF0E7C7B);
  static const Color movieBorder = const Color(0xFF17BEBB);
  static const Color moviePageBackground = const Color(0xFFD4F4DD);
  static const Color movieTitle = const Color(0xFFFFFFFF);
  static const Color movieOverviewDetail = const Color(0xFF0E7C7B);
  static const Color movieOverview = const Color(0x66FFFFFF);
  static const Color movieTagline = const Color(0xFFFFFFFF);

}

class Dimens {
  const Dimens();

  static const movieWidth = 100.0;
  static const movieHeight = 100.0;
}

class TextStyles {

  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
      color: Colors.appBarTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 36.0
  );

  static const TextStyle movieTitle = const TextStyle(
      color: Colors.movieTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 17.0
  );

  static const TextStyle movieOverviewDetail = const TextStyle(
      color: Colors.movieBorder,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 15.0
  );

  static const TextStyle movieOverviewDetailTitle = const TextStyle(
      color: Colors.movieOverviewDetail,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 20.0
  );

  static const TextStyle movieLocation = const TextStyle(
      color: Colors.movieTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 11.0
  );

  static const TextStyle movieTagline = const TextStyle(
      color: Colors.movieTagline,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0
  );

  static const TextStyle movieGenres = const TextStyle(
      color: Colors.movieBorder,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 20.0
  );

}