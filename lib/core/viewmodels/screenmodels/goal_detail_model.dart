// Models
import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/viewmodels/global/engagement_view_model.dart';



class GoalDetailModel extends BaseViewModel {
  EngagementViewModel _evm;


  GoalDetailModel({ EngagementViewModel evm }) : _evm = evm;


  Future<void> setGoal(goalId) async {
    setLoading(true);

    try {
      await _evm.joinGoal(goalId);
    } catch (e) {
      print('error joining goal in goal model');
    }

    setLoading(false);
  }
}
