import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: YFHomePage(),
    );
  }
}

class YFHomePage extends StatefulWidget {
  @override
  _YFHomePageState createState() => _YFHomePageState();
}

class _YFHomePageState extends State<YFHomePage>
    with SingleTickerProviderStateMixin {
  //创建controller
  AnimationController _controller;
  Animation _animation;
  Animation _sizeAni;
  Animation _colorAni;
  Animation _opacityAni;
  Animation _transformAni;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //1.创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    //2.设置cur   有的不支持curved
    _animation = CurvedAnimation(parent: _controller,curve: Curves.linear);
    //3.Tween
    _sizeAni =  Tween(begin: 10.0,end: 200.0).animate(_controller);
    _colorAni = ColorTween(begin: Colors.red,end: Colors.blue ).animate(_controller);
    _opacityAni = Tween(begin: 1.0,end: 0.0).animate(_controller);
    _transformAni = Tween(begin: 0.0,end: 2 * pi).animate(_controller);


    //2.监听值的变化
//    _controller.addListener(() {
//      setState(() {
//
//      });
//    });
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('执行_YFHomePageState build ');
    /**
     * 1.大小
     * 2.颜色
     * 3.透明度
     * 4.旋转
     */
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (ctx,child){
              return Opacity(
                opacity: _opacityAni.value,
                child: Transform(
                  transform: Matrix4.rotationZ(_transformAni.value),
                  alignment: Alignment.center,
                  child: Container(
                    width: _sizeAni.value,
                    height: _sizeAni.value,
                    color: Colors.red,
                  ),
                ),
              );
            },

          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
//          _controller.forward();
          if(_controller.isAnimating){
            _controller.stop();
          }else if(_controller.status == AnimationStatus.forward){
            _controller.forward();
          }else if(_controller.status == AnimationStatus.reverse){
            _controller.reverse();
          }else{
            _controller.forward();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}




/**
 *
 *  final controller = AnimationController(vsync: this);
    final animation = CurvedAnimation(parent: controller,curve: Curves.elasticInOut);
    final valueAnimation = Tween(begin: 100,end: 200).animate(animation);
 * 1.Andimation 抽象类
 *  监听动画值的改变
 *  监听状态改变
 *  value
 *  status
 * 2.AnimationController继承自Animation
 *  vsync:同步信号(this=>with SingleTickerProviderStateMixin)
 *  forward() 向前执行动画
 *  reverse() 反转执行动画
 * 3.curvedAnimation
 *  作用：设置动画执行速率（速度曲线）
 * 4.Tween：设置动画执行的 value范围
 *  begin
 *  end
 */
