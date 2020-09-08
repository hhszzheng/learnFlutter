




import 'package:learn_flutter/_09_state_manager/model/user_info.dart';
import 'package:learn_flutter/_09_state_manager/viewmodel/counter_view_model.dart';
import 'package:learn_flutter/_09_state_manager/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => YFCounterViewModel(),),
  ChangeNotifierProvider(create: (ctx) => YFUserViewModel(UserInfo("why", 29, "abc")),),
];