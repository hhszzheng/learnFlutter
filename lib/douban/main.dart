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
        appBar: AppBar(title: Text('豆瓣App')),
        body: Center(
          child: YFStarRating(),
        )
    );
  }
}

class YFStarRating extends StatefulWidget {

  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  YFStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
  });



  @override
  _YFStarRatingState createState() => _YFStarRatingState();
}

class _YFStarRatingState extends State<YFStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star_border,color: Colors.red,size: 30,),
            Icon(Icons.star_border,color: Colors.red,size: 30,),
            Icon(Icons.star_border,color: Colors.red,size: 30,),
            Icon(Icons.star_border,color: Colors.red,size: 30,),
            Icon(Icons.star_border,color: Colors.red,size: 30,),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star,color: Colors.red,size: 30,),
            Icon(Icons.star,color: Colors.red,size: 30,),
            Icon(Icons.star_border,color: Colors.red,size: 30,),
            Icon(Icons.star_border,color: Colors.red,size: 30,),
            Icon(Icons.star_border,color: Colors.red,size: 30,),
          ],
        )
      ],
    );
  }
}
