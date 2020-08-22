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
      appBar: AppBar(
          title: Text("商品列表")
      ),
      body: YFHomeContent(),
    );
  }
}

class YFHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        YFHomeProduceItem('apple1', 'macbookpro1','https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg'),
        YFHomeProduceItem('apple2', 'macbookpro2','https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg'),
        YFHomeProduceItem('apple3', 'macbookpro3','https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg')
      ],
    );
  }
}

class YFHomeProduceItem extends StatelessWidget {
  final String title;
  final String des;
  final String imageUrl;
  YFHomeProduceItem(this.title,this.des,this.imageUrl);

  final style1 = TextStyle(fontSize: 25,color: Colors.orange);
  final style2 = TextStyle(fontSize: 25,color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border:Border.all(
              width: 5,
              color: Colors.pink
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style:style1),
          SizedBox(height: 8),
          Text(des,style: style2,),
          SizedBox(height: 8),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}
