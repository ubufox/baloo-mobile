import 'dart:async';
import 'package:flutter/foundation.dart';

// Services
import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/services/storage_access.dart';

// Models
import 'package:baloo/core/models/impact_action.dart';
import 'package:baloo/core/models/authentication.dart';
import 'package:baloo/core/models/user_focus.dart';
import 'package:baloo/core/models/statistics.dart';
import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/viewmodels/global/engagement_view_model.dart';


class ImpactModel extends BaseViewModel {
  Api _api;
  EngagementViewModel _evm;
  final _storage = StorageAccess();
  String _token;

  List<ImpactAction> _pendingActions;

  ImpactModel({
    Api api,
    EngagementViewModel evm,
  })
  {
    _api = api;
    _evm = evm;
    _pendingActions = _api.getPendingActions();
  }

  List<ImpactAction> get pendingActions => _pendingActions;
  UserFocus get currentFocus => _evm.currentFocus;
  Statistics get statistics => _evm.userStatistics;


  List pullImpactAction() {
    print('pull impact action');
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
