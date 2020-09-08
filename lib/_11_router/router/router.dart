import 'package:flutter/material.dart';
import '../main.dart';
import '../about.dart';
import '../detail.dart';
import '../unknown.dart';
class YFRouter{
  static final Map<String, WidgetBuilder> routes= {
    YFHomePage.routeName:(ctx)=>YFHomePage(),
    YFAboutPage.routeName:(ctx)=>YFAboutPage()
  };

  static final String initialRoute = YFHomePage.routeName;

  static final RouteFactory generateRoute = (RouteSettings settings){
    if(settings.name == YFDetailPage.routeName){
      return MaterialPageRoute(
          builder: (crx){
            return YFDetailPage(settings.arguments );
          }
      );
    }else{
      return null;
    }
  };

  static final RouteFactory unknownRoute = (settings){
    return MaterialPageRoute(
        builder: (ctx){
          return YFUnknownPage();
        }
    );
  };



}