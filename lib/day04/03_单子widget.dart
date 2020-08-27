import 'package:flutter/material.dart';

main() =>runApp(MyApp());

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
          title: Text('简单widget')
      ),
      body: YFHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>print('floatingActionButtonClick'),
      ),
    );
  }
}

class YFHomeContent extends StatefulWidget {
  @override
  _YFHomeContentState createState() => _YFHomeContentState();
}

class _YFHomeContentState extends State<YFHomeContent> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('heo'),
//      color: Colors.red,
      width: 100,
      height: 100,
      alignment: Alignment(1,-1),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),//外边距
//      transform: Matrix4.skewX(3),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
              color: Colors.purple,
              width: 5
          ),
//        borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(color: Colors.orange,offset:Offset(10,10),spreadRadius: 5,blurRadius: 10),
            BoxShadow(color: Colors.blue,offset:Offset(10,-10),spreadRadius: 5,blurRadius: 10)
          ]
      ),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text('你好，李银河！',style: TextStyle(fontSize: 30,backgroundColor: Colors.cyan),),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: 10
          ),
          child: Text('你好，李银河！',style: TextStyle(fontSize: 30,backgroundColor: Colors.cyan),),
        ),
        Text('你好，李银河！',style: TextStyle(fontSize: 30,backgroundColor: Colors.cyan),)
      ],
    );
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: Column(
        children: [
          Align(
            alignment: Alignment(1,1),
            child: Icon(Icons.pets,size: 50,),
          ),
        ],
      ),
    );
  }
}










