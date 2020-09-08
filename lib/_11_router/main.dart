import 'package:flutter/material.dart';
import 'package:learn_flutter/_11_router/about.dart';
import 'package:learn_flutter/_11_router/detail.dart';
import 'package:learn_flutter/_11_router/router/router.dart';
import 'package:learn_flutter/_11_router/unknown.dart';



main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: YFRouter.initialRoute,
      routes: YFRouter.routes,
      onGenerateRoute: YFRouter.generateRoute,
      onUnknownRoute: YFRouter.unknownRoute
//      home: YFHomePage(),
    );
  }
}

class YFHomePage extends StatefulWidget {
  static const String routeName = '/';
  @override
  _YFHomePageState createState() => _YFHomePageState();
}

class _YFHomePageState extends State<YFHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('列表测试')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('跳转到详情'),
                onPressed: ()=> _jumpToDetail(context),
              ),
              RaisedButton(
                child: Text('跳转到关于'),
                onPressed: ()=> _jumpToAbout(context),
              ),
              RaisedButton(
                child: Text('跳转到详情'),
                onPressed: ()=> _jumpToDetail2(context),
              ),
              RaisedButton(
                child: Text('跳转到设置'),
                onPressed: ()=> _jumpToSettings(context),
              ),
            ],
          ),
        )
    );
  }

  void _jumpToDetail(BuildContext context){
    Future result = Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx){
        return YFDetailPage('a home page');
      }
    ));

    result.then((value) => print(value));

  }
  void _jumpToDetail2(BuildContext context){
    Future result = Navigator.of(context).pushNamed(YFDetailPage.routeName,arguments: 'a home detail2 message');

    result.then((value) => print(value));

  }

  void _jumpToAbout(BuildContext context){
    Future result =  Navigator.of(context).pushNamed(YFAboutPage.routeName,arguments: '路由跳过来的');
    result.then((value) => print(value));
  }


  void _jumpToSettings(BuildContext context){
    Navigator.of(context).pushNamed('/settings');
  }


}