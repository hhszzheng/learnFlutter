


import 'package:flutter/material.dart';
import 'package:learn_flutter/_09_state_manager/viewmodel/counter_view_model.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:provider/provider.dart';


/**
 * 1.创建自己需要共享的数据
 * 2、在应用程序的顶层创建ChangeNotifierProvider
 * 3、在其他地方使用共享的数据
 *
 *  > Provider.of:当provider的数据发生变化时，provider.of 所在的widget整个build方法都会重新构建
 *  > Consumer（相当推荐）:当Provider中的数据发生变化时，执行 重新执行consumer的builder
 *  > Selector:1.selector方法(作用，对原有的数据进行转换)  2.shouldRebuild(要不要重新构建)
 */

main(){
  runApp(
    //2.
      ChangeNotifierProvider(
        child: MyApp(),
        create: (ctx)=>YFCounterViewModel(),
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
            YFShowData02()
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