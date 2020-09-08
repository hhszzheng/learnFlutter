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

class YFHomePage extends StatefulWidget {
  @override
  _YFHomePageState createState() => _YFHomePageState();
}

class _YFHomePageState extends State<YFHomePage> {
  ScrollController _controller = ScrollController(initialScrollOffset: 200);
  bool _isShowFloatingButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
//      print('滚动,${_controller.offset}');

      setState(() {
        _isShowFloatingButton = _controller.offset >= 1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 两种方式可以监听:
     *  controller:
     *   1.可以监听滚动距离
     *   2.可以设置默认值offset
     *
     * NotificationListener
     *   1.可以监听开始滚动和结束滚动
     *   2.
     */
    return Scaffold(
      appBar: AppBar(title: Text('列表测试')),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            print('开始滚动');
          } else if (notification is ScrollUpdateNotification) {
            print('滚动更新,总的滚动距离：${notification.metrics.maxScrollExtent},当前滚动位置${notification.metrics.pixels}');
          } else if (notification is ScrollEndNotification) {
            print('结束滚动');
          }
          return true;
        },
        child: ListView.builder(
            controller: _controller,
            itemCount: 100,
            itemBuilder: (BuildContext ctx, int index) {
              return ListTile(
                leading: Icon(Icons.people),
                title: Text('联系人$index'),
              );
            }),
      ),
      floatingActionButton: _isShowFloatingButton
          ? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo(0,
              duration: Duration(seconds: 1), curve: Curves.easeIn);
        },
      )
          : null,
    );
  }
}
