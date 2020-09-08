
import 'package:flutter/material.dart';


class YFAboutPage extends StatelessWidget {

  static const String routeName = '/detail';
  @override
  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('关于页面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            RaisedButton(
              child: Text('返回首页'),
              onPressed: ()=> Navigator.of(context).pop('从关于页面带过来的值'),
            )
          ],
        ),
      ),
    );
  }
}
