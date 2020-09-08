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
  Animation animation;
  Animation sizeAni;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //1.创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    //2.设置cur
    animation = CurvedAnimation(parent: _controller,curve: Curves.linear);
    //3.Tween
    sizeAni =  Tween(begin: 50.0,end: 150.0).animate(animation);


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
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
          child: YFAnimatedIcon(sizeAni)
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

class YFAnimatedIcon extends AnimatedWidget{

//  final Animation _sizeAnim;
  YFAnimatedIcon(Animation anim):super(listenable:anim);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Animation anim = listenable;
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: anim.value,
    );
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
