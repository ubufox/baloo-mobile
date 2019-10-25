import 'package:flutter/foundation.dart';

import 'package:baloo/core/models/impact_action.dart';
import 'package:baloo/core/models/user_impact.dart';
import 'package:baloo/core/services/api.dart';


class ImpactModel extends ChangeNotifier {
  Api _api;

  UserImpact _userImpact;

  List<ImpactAction> _pendingActions;

  ImpactModel({@required Api api}) {
    _api = api;
    _userImpact = _api.getUserImpact();
    _pendingActions = _api.getPendingActions();
  }

  UserImpact get userImpact => _userImpact;
  List<ImpactAction> get pendingActions => _pendingActions;

  List pullImpactAction() {
    if (_pendingActions.length > 0) {
      ImpactAction a = _pendingActions.first;
      _pendingActions.remove(a);

      return [true, a];
    }

    return [false];
  }

  void completeActions(List<ImpactAction> actions) {
    _pendingActions.insertAll(_pendingActions.length, actions);
    notifyListeners();
  }
}
