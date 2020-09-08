import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter/_06_service/http_request.dart';
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


  final GlobalKey<_YFHomeContentState> homeKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),

      ),
      body:YFHomeContent(key:homeKey) ,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          print(homeKey.currentState.widget.name);
          print(homeKey.currentState.message);
          homeKey.currentState.test();

        },
      ),
    );
  }
}

class YFHomeContent extends StatefulWidget {
  final String name = 'zyf';

  YFHomeContent({Key key}):super(key :key);

  @override
  _YFHomeContentState createState() => _YFHomeContentState();
}

class _YFHomeContentState extends State<YFHomeContent> {

  final String message = '123';
  void test(){
    print('1111111object');
  }
  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
