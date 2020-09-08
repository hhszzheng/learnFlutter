import 'package:flutter/material.dart';

class YFDetailPage extends StatelessWidget {
  static const String routeName = '/detail';
  //构造器传递参数
  final String _message;
  YFDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //当返回为true时，可以自动返回（flutter帮助我们执行返回操作）。
      //当返回为false，自行写返回代码。
      onWillPop: (){
        _backToFirst(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('详情'),
//        leading: IconButton(
//          icon: Icon(Icons.backspace),
//          onPressed: ()=>_backToFirst(context),
//        ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_message),
              RaisedButton(
                child: Text('回到首页'),
                onPressed: ()=> _backToFirst(context),
              )
            ],
          ),
        ),
      ),
    );
  }


  void _backToFirst(BuildContext context){
    print('回到首页');
    Navigator.of(context).pop('a detail message');
  }

}
