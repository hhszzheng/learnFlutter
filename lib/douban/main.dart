import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/main/main.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        splashColor: Colors.blue,
        highlightColor: Colors.transparent
    ),
      home: YFMainPage(),
    );
  }
}


