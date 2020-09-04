import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/douban/pages/home/home_movie_item.dart';
import 'package:learn_flutter/douban/pages/main/initialize_items.dart';
import 'package:learn_flutter/service/home_request.dart';

class YFHomeContent extends StatefulWidget {
  @override
  _YFHomeContentState createState() => _YFHomeContentState();
}

class _YFHomeContentState extends State<YFHomeContent> {
//  final List<MovieItem> movies = [];


  final List<Subject> movies = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //发送网络请求
    HomeRequest.requestMovieList().then((value){
      setState(() {
        movies.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext ctx, int index) {
          return YFHomeMovieItem(movies[index]);
        });
  }
}
