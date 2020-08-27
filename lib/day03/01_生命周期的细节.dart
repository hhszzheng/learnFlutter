import 'package:flutter/material.dart';

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
      appBar: AppBar(
          title: Text("商品列表")
      ),
      body: YFHomeContent(),
    );
  }
}

// statelessWidget生命周期
//class YFHomeContent extends StatelessWidget {
//  final String name;
//  YFHomeContent(this.name){
//    print('构造函数被调用');
//  }
//  @override
//  Widget build(BuildContext context) {
//    print('构造build方法');
//    return Container();
//  }
//}


class YFHomeContent extends StatefulWidget {

  YFHomeContent(){
    print('1.调用homeContent的constructor');
  }

  @override
  _YFHomeContentState createState() {
    print('2.调用homeContent的createState');
    return _YFHomeContentState();
  }
}

class _YFHomeContentState extends State<YFHomeContent> {

  int _counter = 0;

  _YFHomeContentState(){
    print('3.调用_YFHomeContentState的constructor');
  }

  @override
  void initState() {
    // 强调：这里必须调用super  注解函数
    super.initState();
    print('4.调用_YFHomeContentState的initState');
  }
  @override
  void didUpdateWidget(YFHomeContent oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('调用_YFHomeContentState的didUpdateWidget');
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('调用_YFHomeContentState的didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('5.调用_YFHomeContentState的BuildContext');
    return Column(
      children: [
        RaisedButton(
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              _counter++;
            });
          },
        ),
        Text('数字：$_counter')
      ],
    );
  }

  @override
  void dispose() {
    // 强调必须要调用super
    super.dispose();
    print('6.调用_YFHomeContentState的dispose');
  }
}

