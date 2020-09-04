import 'package:flutter/material.dart';

class YFCounterViewModel extends ChangeNotifier{
  int _counter=555;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}