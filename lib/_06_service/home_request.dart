
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/_06_service//http_request.dart';

class HomeRequest{
  static Future<List <Subject>> requestMovieList() async{

    //1.构建url
    final movieUrl = '/douban/movie';
//    HttpRequest.request(movieUrl).then((value) {
//      print(value);
//    });

    // 2.发送网络请求获取结果
    final result = await HttpRequest.request(movieUrl);


    final subjects = result["subjects"];
    List<Subject>movies = [];
    for(var sub in subjects){
      movies.add(Subject.fromMap(sub));
    }
    print(movies);

    // 3.将Map转成Model
//    List<MovieItem> movies = [];
//    for (var sub in subjects) {
//      movies.add(MovieItem.fromMap(sub));
//    }





//    //2.发送网络请求获取结果
//    final result = await HttpRequest.request(movieUrl);
//    final subjects = result['subjects'];
//
//    //3.将map转成model
//    List<MovieItem> movies = [];
//    for(var sub in subjects){
//      movies.add(MovieItem.fromMap(sub));
//    }
//    print(movies);

    return movies;
  }
}