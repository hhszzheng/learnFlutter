




import 'package:learn_flutter/day09/model/user_info.dart';
import 'package:learn_flutter/day09/viewmodel/counter_view_model.dart';
import 'package:learn_flutter/day09/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => YFCounterViewModel(),),
  ChangeNotifierProvider(create: (ctx) => YFUserViewModel(UserInfo("why", 29, "abc")),),
];