import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter/service/http_request.dart';
main() => runApp(MyApp());

class YFCounterWidget extends InheritedWidget{

  //1.共享的数据
  final int counter;

  //2.定义构造方法
  YFCounterWidget({this.counter,Widget child}): super(child:child);

  //3.获取组件最近的当前InheritedWidget
  static YFCounterWidget of(BuildContext context){
    //沿着element树，去找到最近的YFCounterElement,从Element中取出widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  //4.决定是否有回调
  //如果返回true：执行依赖当期的InhertiedWidget的state中的didChangeDependencies
  @override
  bool updateShouldNotify(YFCounterWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.counter != counter;
  }
}


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
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget'),

      ),
      body:YFCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YFShowData01(),
              YFShowData02()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            _counter ++;
          });
        },
      ),
    );
  }
}


class YFShowData01 extends StatefulWidget {

  @override
  _YFShowData01State createState() => _YFShowData01State();
}

class _YFShowData01State extends State<YFShowData01> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print('打印了_YFShowData01State的didChangeDependencies方法');
  }


  @override
  Widget build(BuildContext context) {
    int counter = YFCounterWidget.of(context).counter;
    return Card(
      color: Colors.redAccent,
      child: Text('计数$counter',style: TextStyle(fontSize: 30,color: Colors.blue),),
    );
  }
}


class YFShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = YFCounterWidget.of(context).counter;
    return Container(
      child: Text('计数$counter',style: TextStyle(fontSize: 30,color: Colors.redAccent),),
      color: Colors.green,
    );
  }
}