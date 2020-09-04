import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/douban/widget/dashed_line.dart';
import 'package:learn_flutter/douban/widget/star_rating.dart';

class YFHomeMovieItem extends StatelessWidget {
//  final MovieItem movie;

  final Subject movie;

  YFHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xffcccccc)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //交叉轴靠左边
        children: [
          buildHeader(),
          SizedBox(
            height: 8,
          ),
          buildContent(),
          SizedBox(
            height: 8,
          ),
          buildFooter()
        ],
      ),
    );
  }

  //1.头部电影排名：
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        'No.${movie.rank}',
        style: TextStyle(color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  //2.内容布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        SizedBox(
          width: 8,
        ),
        buildContentInfo(),
        SizedBox(
          width: 8,
        ),
        buildContentline(),
        SizedBox(
          width: 8,
        ),
        buildContentWish(),
      ],
    );
  }

  //2.1 内容图片
  Widget buildContentImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          movie.images.medium,
          height: 150,
        ));
  }

  //2.2 内容信息
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContentInfoTitle(),
          SizedBox(
            height: 8,
          ),
          buildContentInforRate(),
          SizedBox(
            height: 8,
          ),
          buildContentInforDesc()
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(TextSpan(children: [
      WidgetSpan(
        child: Icon(
          Icons.play_circle_outline,
          color: Colors.redAccent,
          size: 24,
        ),
      ),
      TextSpan(
        text: '${movie.title}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: '(${movie.year})',
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    ]));
  }

  Widget buildContentInforRate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        YFStarRating(
          rating: movie.rating.average,
          count: 5,
          selectedColor: Colors.yellow,
          size: 20,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          '${movie.rating.average}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget buildContentInforDesc() {
    //1.字符串拼接
    final genresString = movie.genres.join(' ');

    final directorsString = movie.directors.map((e) => e.name).join(' ');
    final actorsString = movie.casts.map((e) => e.name).join(' ');

    return Text(
      '$genresString / $directorsString / $actorsString',
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  //2.3内容的虚线
  Widget buildContentline() {
    return Container(
        height: 100,
        child: YFDashedLine(
          axis: Axis.vertical,
          count: 10,
          dashedWidth: 0.5,
          dashedHeight: 6,
        ));
  }

  //2.4内容的想看
  Widget buildContentWish() {
    return Column(
      children: [
        Image.asset('assets/images/home/wish.png'),
        Text(
          '想看',
          style: TextStyle(fontSize: 16, color: Colors.orange),
        )
      ],
    );
  }

  //3.尾部的布局
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xffe2e2e2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        movie.originalTitle,
        style: TextStyle(fontSize: 20, color: Color(0xff666666)),
      ),
    );
  }
}
