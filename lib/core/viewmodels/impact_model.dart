import 'dart:async';
import 'package:flutter/foundation.dart';

// Services
import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/services/storage_access.dart';

// Models
import 'package:baloo/core/models/impact_action.dart';
import 'package:baloo/core/models/authentication.dart';
import 'package:baloo/core/models/user_impact.dart';
import 'package:baloo/core/viewmodels/base_view_model.dart';


class ImpactModel extends BaseViewModel {
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
    setLoading(true);
    if (_token == null) {
      _token = await _storage.getJWT();
    }

    try {
      String stats = await _api.engage.getUserStats(_token);
      print('got user stats');
      print(stats);
    } catch (e) {
      print('error getting stats');
      print(e.toString());
    }

    setLoading(false);
  }

  Future<void> loadGloablStats() async {
    setLoading(true);

    try {
      String stats = await _api.engage.getGlobalStats();
      print('got global stats');
      print(stats);
    } catch (e) {
      print('error getting stats');
      print(e.toString());
    }

    setLoading(false);
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
