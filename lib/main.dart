import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter/_06_service/http_request.dart';
import 'package:provider/provider.dart';


/**
 * 1.创建自己需要共享的数据
 * 2、在应用程序的顶层创建ChangeNotifierProvider
 * 3、在其他地方使用共享的数据
 */

//main(){
////  runApp(
////      ChangeNotifierProvider(
////        child: MyApp(),
////        create: ,
////      )
////  );
////}
main(){
  runApp(MyApp());
}

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
      appBar: AppBar(
        title: Text('测试'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YFShowData01(),
            YFShowData02()
          ],
        ),
      ),
    );
  }
}


class YFShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('计数100',style: TextStyle(fontSize: 30,color: Colors.redAccent),),
      color: Colors.blue,
    );
  }
}


class YFShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('计数99',style: TextStyle(fontSize: 30,color: Colors.redAccent),),
      color: Colors.green,
    );
  }
}