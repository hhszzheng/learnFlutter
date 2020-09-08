import 'package:flutter/material.dart';

class ImageDemo02 extends StatelessWidget {
  const ImageDemo02({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/timg.jpeg');
  }
}

class ImageDemo01 extends StatelessWidget {
  const ImageDemo01({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
//    return Image.network(imageURL);
    return Image(
        image: NetworkImage(imageURL),
        color: Colors.green,
        colorBlendMode: BlendMode.colorDodge,//颜色混入
        width: 200,
        height: 200,
        fit: BoxFit.contain,//cover
        repeat: ImageRepeat.repeatY,
//      alignment: Alignment.topCenter,
        alignment: Alignment(0,0)
    );
  }
}