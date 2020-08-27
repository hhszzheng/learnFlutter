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
      appBar: AppBar(title: Text('简单widget')),
      body: YFHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('floatingActionButtonClick'),
      ),
    );
  }
}

class YFHomeContent extends StatefulWidget {
  @override
  _YFHomeContentState createState() => _YFHomeContentState();
}

class _YFHomeContentState extends State<YFHomeContent> {
  @override
  Widget build(BuildContext context) {
    return StackDemo2();
  }
}

class StackDemo2 extends StatelessWidget {
  const StackDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/timg.jpeg'),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
//          width: double.infinity,
            color: Color.fromARGB(150, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '进击的巨人',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.white,
                  onPressed: () => print('dd'),
                )
              ],
            ),
            padding: EdgeInsets.all(8),
          ),
        )
      ],
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * Stack默认大小是包裹的
     * alignment 从什么位置开始排布widget
     * fit:expand 将子元素拉伸到尽可能大
     * overflow:超出部分如何处理
     */

    return Stack(
      alignment: Alignment.center,
//      fit: StackFit.expand,
      overflow: Overflow.visible, //超出部分
      children: [
        Image.asset('assets/images/timg.jpeg'),
        //绝对定位效果
        //Positioned组件只能在Stack中使用。
        Positioned(
          child: Container(
            width: 150,
            height: 150,
            color: Colors.red,
          ),
          bottom: -20,
        ),
        Positioned(
          child: Text('巨人'),
          bottom: 10,
          right: 20,
        )
      ],
    );
  }
}

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      //互换方向
      mainAxisSize: MainAxisSize.min,

      children: [
        Container(
          width: 80,
          height: 60,
          color: Colors.red,
          child: Text(
            'hello',
            style: TextStyle(fontSize: 10),
          ),
        ),
        Container(
            width: 120,
            height: 100,
            color: Colors.yellow,
            child: Text(
              'word',
              style: TextStyle(fontSize: 30),
            )),
        Container(
            width: 100,
            height: 80,
            color: Colors.green,
            child: Text(
              '111',
              style: TextStyle(fontSize: 20),
            )),
        Container(
            width: 50,
            height: 120,
            color: Colors.blue,
            child: Text(
              '125z',
              style: TextStyle(fontSize: 15),
            )),
      ],
    );
  }
}

class RaiseButtonDemo extends StatelessWidget {
  const RaiseButtonDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.add), Text('添加')],
      ),
    );
  }
}

class RowDemo extends StatelessWidget {
  const RowDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //row column：继承自Flex
    //Axis.vertical:Column
    //Axis.horizontal:Row
//    return Flex(direction: Axis.horizontal);
    /**
     *  Row特点:
     *    - 水平方向尽可能占据比较大的空间
     *      *水平方向尽可能的希望多包裹内容，那么设置mainAxisSize=min
     *    - 垂直方向尽可能占据比较大的空间
     *
     *  mainAxisAlignment: MainAxisAlignment.start,
     *   -start 从主轴开始排布
     *   -end  从主轴末端开始
     *   -center 主轴中心点
     *   -spacebetween 左右两边为零 其余平分
     *   -spaceAround 最有两边间距是其他的一半
     *   -spaceEvenly 所有空间平分
     *
     *  CrossAxisAligment:CrossAxisAligment.start
     *     -start 交叉轴起始位置
     *     -end   交叉轴末端位置
     *     -center 交叉轴中心位置
     *     -stretch 拉伸 将所有子元素拉伸到最大
     *     -baseline 基线对齐(必须有文本才有效果)
     *
     *
     */
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        mainAxisSize: MainAxisSize.max,
        //默认max  min就没有空间了
        children: [
          Container(
            width: 80,
            height: 60,
            color: Colors.red,
            child: Text(
              'hello',
              style: TextStyle(fontSize: 10),
            ),
          ),
          Container(
              width: 120,
              height: 100,
              color: Colors.yellow,
              child: Text(
                'word',
                style: TextStyle(fontSize: 30),
              )),
          Container(
              width: 100,
              height: 80,
              color: Colors.green,
              child: Text(
                '111',
                style: TextStyle(fontSize: 20),
              )),
          Container(
              width: 50,
              height: 120,
              color: Colors.blue,
              child: Text(
                '125z',
                style: TextStyle(fontSize: 15),
              )),
        ],
      ),
    );
  }
}

//基本使用
class RowDemo1 extends StatelessWidget {
  const RowDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     *  Row特点:
     *    - 水平方向尽可能占据比较大的空间
     *      *水平方向尽可能的希望多包裹内容，那么设置mainAxisSize=min
     *    - 垂直方向尽可能占据比较大的空间
     *
     *  mainAxisAlignment: MainAxisAlignment.start,
     *   -start 从主轴开始排布
     *   -end  从主轴末端开始
     *   -center 主轴中心点
     *   -spacebetween 左右两边为零 其余平分
     *   -spaceAround 最有两边间距是其他的一半
     *   -spaceEvenly 所有空间平分
     *
     *  CrossAxisAligment:CrossAxisAligment.start
     *     -start 交叉轴起始位置
     *     -end   交叉轴末端位置
     *     -center 交叉轴中心位置
     *     -stretch 拉伸 将所有子元素拉伸到最大
     *     -baseline 基线对齐(必须有文本才有效果)
     *
     *
     */
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        mainAxisSize: MainAxisSize.max,
        //默认max  min就没有空间了
        children: [
          Container(
            width: 80,
            height: 60,
            color: Colors.red,
            child: Text(
              'hello',
              style: TextStyle(fontSize: 10),
            ),
          ),
          Container(
              width: 120,
              height: 100,
              color: Colors.yellow,
              child: Text(
                'word',
                style: TextStyle(fontSize: 30),
              )),
          Container(
              width: 100,
              height: 80,
              color: Colors.green,
              child: Text(
                '111',
                style: TextStyle(fontSize: 20),
              )),
          Container(
              width: 50,
              height: 120,
              color: Colors.blue,
              child: Text(
                '125z',
                style: TextStyle(fontSize: 15),
              )),
        ],
      ),
    );
  }
}

//2.Expanded
class RowDemo2 extends StatelessWidget {
  const RowDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     *  Row特点:
     *    - 水平方向尽可能占据比较大的空间
     *      *水平方向尽可能的希望多包裹内容，那么设置mainAxisSize=min
     *    - 垂直方向尽可能占据比较大的空间
     *
     *  mainAxisAlignment: MainAxisAlignment.start,
     *   -start 从主轴开始排布
     *   -end  从主轴末端开始
     *   -center 主轴中心点
     *   -spacebetween 左右两边为零 其余平分
     *   -spaceAround 最有两边间距是其他的一半
     *   -spaceEvenly 所有空间平分
     *
     *  CrossAxisAligment:CrossAxisAligment.start
     *     -start 交叉轴起始位置
     *     -end   交叉轴末端位置
     *     -center 交叉轴中心位置
     *     -stretch 拉伸 将所有子元素拉伸到最大
     *     -baseline 基线对齐(必须有文本才有效果)
     *
     *
     */
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        mainAxisSize: MainAxisSize.max,
        //默认max  min就没有空间了
        children: [
          /**
           *  Flexible中的属性：
           *  -flex
           *  Expanded == Flexible(fit:FlexFit.tight)
           *  只要包裹了Expanded,宽度就没有关系了 按照flex比例算
           *
           */
          Expanded(child: Container(width: 80, height: 60, color: Colors.red)),
          Expanded(
              child: Container(width: 120, height: 100, color: Colors.yellow)),
          Container(width: 100, height: 80, color: Colors.green),
          Container(width: 50, height: 120, color: Colors.blue),
        ],
      ),
    );
  }
}
