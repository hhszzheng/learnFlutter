import 'dart:math';

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
//      appBar: AppBar(title: Text('列表测试')),
      body: CustomScrollView02(),
    );
  }
}

class CustomScrollView02 extends StatelessWidget {
  const CustomScrollView02({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('hello world'),
            background: Image.asset('assets/images/timg.jpeg',fit: BoxFit.cover,),
          ),
        ),
        SliverGrid(//collection
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),
          delegate: SliverChildBuilderDelegate((BuildContext ctx, int index) {
            return Container(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
            );
          }, childCount: 6),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext ctx,int index){
                return ListTile(
                  leading: Icon(Icons.people),
                  title: Text('联系人$index'),
                );
              },
              childCount: 20

          ),
        ),
      ],
    );
  }
}

class CustomScrollView1 extends StatelessWidget {
  const CustomScrollView1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(//安全区能滚上去 ios端
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.5,
              ),
              delegate: SliverChildBuilderDelegate((BuildContext ctx, int index) {
                return Container(
                  color: Color.fromARGB(255, Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256)),
                );
              }, childCount: 50),
            ),
          ),
        )
      ],
    );
  }
}
