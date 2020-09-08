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
        body: Center(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTapDown: (detail){
                    print('outClick');
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.yellow,
                    alignment: Alignment.center,

                  ),
                ),

                IgnorePointer(
                  child: GestureDetector(
                    onTapDown: (detail){
                      print('inClick');
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                )



              ],
            ),
          ),
        ));
  }
}

class gestureDemo extends StatelessWidget {
  const gestureDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details){
        print('手指按下${details.localPosition}');
        print('手指按下${details.globalPosition}');
      },
      onTapUp: (details){
        print('手指抬起$details');
      },
      onTapCancel: (){
        print('手指取消');
      },
      onTap: (){
        print('手指点击');
      },
      onDoubleTap: (){
        print('手势双击');
      },

      child: Container(
        width: 200,
        height: 200,
        color: Colors.orange,
      ),

    );
  }
}

class ListenerDemo extends StatelessWidget {
  const ListenerDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print('指针按下$event');
        print(event.position);
        print(event.localPosition);
      },
      onPointerMove: (event) {
        print('指针移动$event');
      },
      onPointerUp: (event) {
        print('指针抬起$event');
      },
      onPointerSignal: (event) {
        print('指针移动$event');
      },
      child: Container(
//            child: Text('fddfdf'),
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}
