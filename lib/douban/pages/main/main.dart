import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/main/initialize_items.dart';

class YFMainPage extends StatefulWidget {
  @override
  _YFMainPageState createState() => _YFMainPageState();
}

class _YFMainPageState extends State<YFMainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


