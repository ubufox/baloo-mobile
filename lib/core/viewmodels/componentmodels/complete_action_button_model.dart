// Models
import 'package:baloo/core/models/user_action.dart';

// View Models
import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/viewmodels/global/engagement_view_model.dart';


class CompleteActionButtonModel extends BaseViewModel {
  EngagementViewModel _evm;

  CompleteActionButtonModel({
    EngagementViewModel evm,
  }) : _evm = evm;

  UserAction get currentAction => _evm.currentAction;

  Future<void> complete() async {
    setLoading(true);

    await _evm.completeFocusedAction(_evm.currentAction.id);

    setLoading(false);
  }
}
