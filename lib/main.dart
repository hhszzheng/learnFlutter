import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter/service/http_request.dart';
main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YFHomePage(),
    );
  }
}

class YFHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('列表测试')),
        body: YFHomeContent()
    );
  }
}

class YFHomeContent extends StatefulWidget {
  @override
  _YFHomeContentState createState() => _YFHomeContentState();
}

class _YFHomeContentState extends State<YFHomeContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //发送网络请求
    //1.创建dio对象
//    final dio = Dio();

    //2.发送网络请求
//    dio.get('https://httpbin.org/get').then((value) {
//      print(value);
//    });

    HttpRequest.request('http://123.207.32.32:8001/api/douban/movie',).then((value){
      print(value);
    }).catchError((err){
      print(err);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

