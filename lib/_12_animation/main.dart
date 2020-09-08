import 'package:flutter/material.dart';
import 'package:learn_flutter/_12_animation/page/image_detail.dart';
import 'package:learn_flutter/_12_animation/page/model_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,splashColor: Colors.transparent
      ),
      home: YFHomePage(),
    );
  }
}

class YFHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            title: Text('首页')
        ),
        body: Center(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 16/9
              ),
              children: List.generate(20, (index){
                final imageURL = 'https://picsum.photos/500/500?random=$index';
                return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx){
                          return YFImageDetailPage(imageURL);
                        }
                      ));
                    },
                    child: Hero(
                      tag: imageURL,
                      child: Image.network(
                        imageURL,
                        fit: BoxFit.cover,),
                    ));
              }),
            )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){

            Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: Duration(seconds: 3),
              pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                return FadeTransition(
                    opacity: animation,
                    child: YFModelPage(),

                );
              }
            ));

//            Navigator.of(context).push(MaterialPageRoute(
//                builder: (ctx){
//                  return YFModelPage();
//                },
//                fullscreenDialog: true,//ios 模态
//            ));



          },
        ),

    );
  }
}