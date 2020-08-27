
import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //1.RaisedButton  凸起
        RaisedButton(
          child: Text('RaisedButton'),
          color: Colors.purple,
          onPressed: (){
            print('打印');
          },
        ),
        //2.FlatButton  扁平
        FlatButton(
          child: Text('FlatButton'),
          color: Colors.orange,
          onPressed: ()=> print('点击了'),
        ),
        OutlineButton(
          child: Text('ontlineButton'),
          color: Colors.red,
          onPressed: ()=> print('点击了'),
        ),
        //自定义button
        FlatButton(
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite),
              Text('哈哈哈哈')
            ],
          ),
          onPressed: ()=>print('1111'),
        )
      ],
    );
  }
}