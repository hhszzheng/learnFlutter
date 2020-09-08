


import 'package:flutter/material.dart';
import 'package:learn_flutter/_09_state_manager/model/user_info.dart';
import 'package:learn_flutter/_09_state_manager/viewmodel/counter_view_model.dart';
import 'package:learn_flutter/_09_state_manager/viewmodel/initlize_providers.dart';
import 'package:learn_flutter/_09_state_manager/viewmodel/user_view_model.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:provider/provider.dart';



main(){
  
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: providers,
    )
  );
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
            YFShowData02(),
            YFShowData03()
          ],
        ),
      ),
      floatingActionButton: Selector<YFCounterViewModel,YFCounterViewModel>(
        selector: (ctx,counterVM) => counterVM,
        shouldRebuild: (prev,next) => true,
        builder: (ctx,counterVM,child){
          print('floating builder被打印');
          return FloatingActionButton(
            child:child,
            onPressed: (){
              counterVM.counter += 1;
            },
          );
        },
        child:Icon(Icons.add) ,
      )
    );
  }
}


class YFShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<YFCounterViewModel>(context).counter;
    print('data01 build方法');
    return Container(
      child: Text('计数$counter',style: TextStyle(fontSize: 30,color: Colors.redAccent),),
      color: Colors.blue,
    );
  }
}


class YFShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('data02 build方法');
    return Container(
      child: Consumer<YFCounterViewModel>(
        builder: (ctx,counterVC,child){
          return Text('计数${counterVC.counter}',style: TextStyle(fontSize: 30,color: Colors.redAccent),);
        },
      ),
      color: Colors.green,
    );
  }
}

class YFShowData03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<YFUserViewModel,YFCounterViewModel>(
        builder: (ctx,userVM,counterVM,child){
          return Text('nickname:${userVM.user.nickName},counter:${counterVM.counter}',style: TextStyle(fontSize: 30,color: Colors.red),);
        }
    );
  }
}
