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
        appBar: AppBar(title: Text('列表测试')),
        body: ListViewDemo3());
  }
}

class ListViewDemo3 extends StatelessWidget {
  const ListViewDemo3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext ctx,int index){
        return Text(
          'hello world!:$index',
          style: TextStyle(fontSize: 30),
        );
      },
      separatorBuilder: (BuildContext ctx,int index){
        return Divider(
          color: Colors.red,
          height: 100,//空间高度
          indent: 30,//线条颜色
          endIndent: 30,//后面线
          thickness: 30,//前面线
        );
      },
    );
  }
}

class ListViewDemo2 extends StatelessWidget {
  const ListViewDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //需要的时候在创建
      itemCount: 100,
      itemExtent: 100,
      itemBuilder: (BuildContext ctx, int index) {
        return Text(
          'hello world!:$index',
          style: TextStyle(fontSize: 30),
        );
      },
    );
  }
}

class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
//        scrollDirection: Axis.horizontal,//水平滚动
      itemExtent: 100, //不设置 自动内容计算高度
      reverse: true,
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text('联系人${index + 1}'),
          subtitle: Text('联系人电话号码:1832211211'),
        );
      }),
    );
  }
}
