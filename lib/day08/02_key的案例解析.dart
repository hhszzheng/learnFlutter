import 'dart:math';

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

class YFHomePage extends StatefulWidget {

  @override
  _YFHomePageState createState() => _YFHomePageState();
}

class _YFHomePageState extends State<YFHomePage> {
  final List<String> names = ['aaa','bbbb','cccc'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('列表测试')),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              names.removeAt(0);
            });
          },
          child: Icon(Icons.delete),
        ),
        body: ListView(
          children: names.map((e) {
            return ListItemFul(e,key: UniqueKey(),);
          }).toList(),
        )
    );
  }
}

class ListItemLess extends StatelessWidget {

  final String name;
  final Color randomColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
  ListItemLess(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name,),
      height: 80,
      color:randomColor,
    );
  }
}
class ListItemFul extends StatefulWidget {

  final String name;
  ListItemFul(this.name,{Key key}):super(key : key);

  @override
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
  final Color randomColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name,),
      height: 80,
      color:randomColor,
    );
  }
}