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
      body: YFHomeContent('你好，我是jay'),
    );
  }
}

class YFHomeContent extends StatefulWidget {
  final String message;
  YFHomeContent(this.message);
  @override
  _YFHomeContentState createState() => _YFHomeContentState();
}
/**
 * 为什么flutter设计的时候statefulWidge的build方法放在State中
 * 1.build出来的widget是需要依赖State中的变量的（状态、数据）
 * 2.在Flutter运行过程中：
 * widget不断创建销毁
 * 当我们自己的状态发生改变时，并不想重新创建一个新的state
 */
class _YFHomeContentState extends State<YFHomeContent> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getButtons(),
          Text('当前基数：$_counter',style: TextStyle(fontSize: 25,),),
          Text('传递过来的参数:${widget.message}')
        ],
      ),
    );
  }
  Widget _getButtons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
            child: Text('+',style: TextStyle(fontSize: 20,color: Colors.white),),
            color: Colors.green,
            onPressed: (){
              setState(() {
                _counter++;
              });
            }
        ),
        RaisedButton(
            child: Text('-',style: TextStyle(fontSize: 20,color: Colors.white)),
            color: Colors.purple,
            onPressed: (){
              setState(() {
                _counter --;
              });
            }
        ),
      ],
    );
  }

}


