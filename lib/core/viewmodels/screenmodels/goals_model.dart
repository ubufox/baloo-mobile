// Models
import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/viewmodels/global/goals_view_model.dart';
import 'package:baloo/core/viewmodels/global/engagement_view_model.dart';
import 'package:baloo/core/models/new_goal.dart';
import 'package:baloo/core/models/user_goal.dart';


class GoalsModel extends BaseViewModel {
  GoalsViewModel _gvm;
  EngagementViewModel _evm;


  GoalsModel({
    GoalsViewModel gvm,
    EngagementViewModel evm
  }) :
    _gvm = gvm,
    _evm = evm;


  bool get loading => _gvm.loading || _evm.loading;
  UserGoal get activeGoal => _evm.activeGoal;
  List<NewGoal> get personal => _gvm.goals
    .where((g) => g.type == 'personal')
    .toList();
  List<NewGoal> get community => _gvm.goals
    .where((g) => g.type == 'community')
    .toList();
}
