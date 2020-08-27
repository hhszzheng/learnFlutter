import 'package:flutter/material.dart';

class IconExtensionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //1.icon 字体图标 图片图标
    //2.不会失真
    //3.图标多时候，占的空间小
//    return Icon(Icons.pets,size: 100,color: Colors.orange,);


    return Text("\ue91d",style: TextStyle(fontSize: 100,color: Colors.purple,fontFamily:'MaterialIcons' ),);

//    return ImageExtenstionDemo(imageURL: imageURL);
  }
}




class ImageExtenstionDemo extends StatelessWidget {
  const ImageExtenstionDemo({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      //1.占位图
      //2.图片缓存 1000张  100m
      fadeOutDuration: Duration(seconds: 2),
      placeholder: AssetImage('assets/images/timg.jpeg'),
      image: NetworkImage(imageURL),
    );
  }
}

class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //1.默认button有一定间距
        //2.button如何变小  需要ButtonTheme这个widget
        //3.去除button的内边距
        ButtonTheme(
          minWidth: 30,
          height: 10,
          child: FlatButton(
            child: Text('FlatButton1'),
            //去除上下边距
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: (){},
            color: Colors.green,
            textColor: Colors.white,
            padding: EdgeInsets.all(0),
          ),
        ),
        FlatButton(
//          child: Text('FlatButton2'),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: (){},
          color: Colors.green,
          textColor: Colors.white,
        ),
      ],
    );
  }
}