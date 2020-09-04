import 'package:flutter/material.dart';



class YFStarRating extends StatefulWidget {

  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;
  final Widget unselectedImage;
  final Widget selectedImage;

  YFStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget unselectedImage,
    Widget selectedImage
  }): unselectedImage = unselectedImage ?? Icon(
      Icons.star_border, color: unselectedColor, size: size),
        selectedImage = selectedImage ?? Icon(
            Icons.star, color: selectedColor, size: size);


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
          children: buildUnSelectedStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStar(),
        )
      ],
    );
  }

  List<Widget> buildUnSelectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar() {
    //1.创建stars
    List<Widget> stars = [];
    final star = widget.selectedImage;
    //2.构建满的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor(); //向下取整
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }
    //3.构建部分填充star
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halfStar = ClipRect(
        clipper:YFStarClipper(leftWidth),
        child: star
    );

    stars.add(halfStar);

    if(stars.length > widget.count){
      return stars.sublist(0,widget.count);
    }

    return stars;
  }

}

class YFStarClipper extends CustomClipper<Rect>{

  double width;
  YFStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(YFStarClipper oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper.width != this.width;
  }

}