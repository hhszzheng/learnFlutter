import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';



//1.创建一个全局的eventBus对象
final eventBus = EventBus();

class UserInfo{
  String nickName;
  int level;
  UserInfo(this.nickName,this.level);
}


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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YFButton(),
              YFText()
            ],
          ),
        )
    );
  }
}

class YFButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('按钮'),
      onPressed: (){
        final info = UserInfo('zzz',18);
        //2.发送
//        eventBus.fire('你好world');
        eventBus.fire(info);
      },
    );
  }
}

class YFText extends StatefulWidget {
  @override
  _YFTextState createState() => _YFTextState();
}

class _YFTextState extends State<YFText> {
  String _message = 'hello world';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //3.监听事件类型
    eventBus.on<UserInfo>().listen((event) {
      print(event.nickName);
      setState(() {
        _message = event.nickName;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message ,style: TextStyle(fontSize: 30,color: Colors.red),);
  }
}
