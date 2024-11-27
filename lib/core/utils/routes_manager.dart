import 'package:flutter/material.dart';
import 'package:news/data/api/model/articles_response/articles.dart';
import 'package:news/presentation/screens/details/news_details_screen.dart';
import 'package:news/presentation/screens/home/home.dart';
import 'package:news/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
    static const String newsdetailsscreen = '/newsdetailsscreen';


  // ignore: body_might_complete_normally_nullable
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
      case newsdetailsscreen:
        final arguments = settings.arguments; // استقبال الـ arguments
        return MaterialPageRoute(
          builder: (context) => NewsDetailsScreen(
            articles: arguments as Articles?, // تمرير الـ arguments هنا
          ),
        );

    }
  }
}
