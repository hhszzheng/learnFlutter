import 'package:flutter/material.dart';

//main(){
//  runApp(
//      YFHomeWidge()
//  );
//}

main() => runApp(MyApp());

/**
 * Widget分类：
 * 有状态：StatefulWidget 运行过程中有一些状态(data)改变
 * 无状态：StatelessWidget 内容是确定没有状态(data)不会改变
 */
class MyApp extends StatelessWidget{
  //build方法
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: YFHomePage()
    );
  }
}

class YFHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '第一个flutter程序'
          ),
        ),
        body: YFContentBody()
    );
  }
}


//StatefulWeight分为两类：继承自StatefulWeight的类（可接受父widget传来的数据）和State类（状态）


//flag状态
//stateful不能定义状态 -> 创建一个单独的类，这个类负责维护状态
class YFContentBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return YFContentBodyState();
  }
}

class YFContentBodyState extends State<YFContentBody>{
  var flag = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: flag,
            onChanged: (value){
              setState(() {
                flag = value;
              });

              print(value);
            },
          ),
          Text('用户协议')
        ],
      ),
    );
  }
}





















//无法实现 点击改变
//class YFContentBody extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Row(
//        //居中
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Checkbox(
//            value: true,
//            onChanged: (value){
//              value = !value;
//              print(value);
//            },
//          ),
//          Text('用户协议!',style: TextStyle(fontSize: 30),)
//        ],
//      ),
//    );
//  }
//}