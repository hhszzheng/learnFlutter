
import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/day09/model/user_info.dart';

class YFUserViewModel extends ChangeNotifier{
  UserInfo _user;

  YFUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }
}