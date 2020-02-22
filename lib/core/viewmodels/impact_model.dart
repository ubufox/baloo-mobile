import 'dart:async';
import 'package:flutter/foundation.dart';

// Services
import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/services/storage_access.dart';

// Models
import 'package:baloo/core/models/impact_action.dart';
import 'package:baloo/core/models/authentication.dart';
import 'package:baloo/core/models/user_impact.dart';


class ImpactModel extends ChangeNotifier {
  Api _api;
  final _storage = StorageAccess();
  String _token;

  UserImpact _userImpact;

  List<ImpactAction> _pendingActions;

  ImpactModel({ @required Api api }) {
    _api = api;

    _userImpact = _api.getUserImpact();
    _pendingActions = _api.getPendingActions();
  }

  UserImpact get userImpact => _userImpact;
  List<ImpactAction> get pendingActions => _pendingActions;


  Future<void> loadUserStats() async {
    if (_token == null) {
      _token = await _storage.getJWT();
    }

    String stats = await _api.engage.getUserStats(_token);
    print('got user stats');
    print(stats);
  }


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
