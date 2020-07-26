import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';

// Services
import 'package:baloo/core/services/graphql.dart';
import 'package:baloo/core/services/api.dart';

// Models
import 'package:baloo/core/models/user_goal.dart';
import 'package:baloo/core/models/user_focus.dart';
import 'package:baloo/core/models/user_action.dart';
import 'package:baloo/core/models/statistics.dart';
import 'package:baloo/core/models/stream_types/client_available.dart';
import 'package:baloo/core/viewmodels/global/base_global_view_model.dart';

// Queries
import 'package:baloo/core/queries/user_goals.dart';


// Gets the user's goals, focuses, actions
class EngagementViewModel extends BaseGlobalViewModel {
  // Define required properties
  List<UserGoal> _userGoals;
  UserGoal _activeGoal;
  UserFocus _currentFocus;
  Statistics _userStatistics;
  int _numPendingActions = 0;
  Api _api;


  EngagementViewModel({
    GraphQLService gqls,
    Api api,
  }) :
    _api = api,
    super(gqls: gqls);


  // Getters and Setters
  UserGoal get activeGoal => _activeGoal;
  UserFocus get currentFocus => _currentFocus;
  UserAction get currentAction => getCurrentAction();
  Statistics get userStatistics => _userStatistics;
  int get numPendingActions => _numPendingActions;

  UserAction getCurrentAction() {
    if (loading) {
      return null;
    }

    return _currentFocus
      .actions
      .firstWhere((a) => a.completedAt == null, orElse: () => null);
  }


  UserGoal getActiveGoal() {
    _activeGoal = _userGoals.firstWhere((g) => g.isActive, orElse: () => null);
    print(activeGoal.text);

    return _activeGoal;
  }

  UserFocus getCurrentFocus() {
    List<UserFocus> focuses = [...activeGoal.focuses];

    focuses.sort((UserFocus a, UserFocus b) =>
      b.position.compareTo(a.position)
    );

    _currentFocus = focuses[0];
    return focuses[0];
  }

  Future<void> loadUserStats() async {
    setLoading(true);

    try {
      String stats = await _api.engage.getUserStats();
      _userStatistics = Statistics.fromJSON(json.decode(stats));
    } catch (e) {
      print('error getting stats');
      print(e.toString());
    }

    setLoading(false);
  }

  Future<void> loadGlobalStats() async {
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



  // Initialize Function
  @override
  void initialize(ClientAvailable hasClient) async {
    print('initialize engagement model');
    if (hasClient.value == false) {
      isReady = false;
      empty();
    } else {
      setLoading(true);

      try {
        QueryResult result = await gqls.runQuery(GetUserGoals());

        if (result == null) {
          throw('Failed user goals request');
        }

        if (result.exception == null) {
          _userGoals = result.data['user_goal']
            .map<UserGoal>(
              (goal) => UserGoal.fromJSON(goal)
            ).toList();

          print('engagement initialized');
          getActiveGoal();
          getCurrentFocus();
          await loadUserStats();

          setLoading(false);
        } else {
          throw(result.exception.toString());
        }
      } catch (e) {
        print('error initializing user goals');
        print(e.toString());
        setError(e.toString());
      }
    }
  }

  Future<void> refresh() async {
    setLoading(true);

    try {
      QueryResult result = await gqls.runQuery(GetUserGoals());

      if (result == null) {
        throw('Failed user goals request');
      }

      if (result.exception == null) {
        _userGoals = result.data['user_goal']
          .map<UserGoal>(
            (goal) => UserGoal.fromJSON(goal)
          ).toList();

        setLoading(false);
      } else {
        throw(result.exception.toString());
      }
    } catch (e) {
      print('error initializing user goals');
      print(e.toString());
      setError(e.toString());
    }
  }


  Future<void> joinGoal(String goalId) async {
    setLoading(true);
    _activeGoal.isActive = false;

    try {
      await _api.engage.joinGoal(goalId);
      setLoading(false);

      _activeGoal = _userGoals.firstWhere((g) => g.goalId == goalId);
      _activeGoal.isActive = true;
    } catch (e) {
      print('error joining goal');
      print(e);
      setLoading(false);
    }
  }

  Future<void> completeFocusedAction(String userActionId) async {
    setLoading(true);

    try {
      await _api.engage.completeAction(userActionId);

      _numPendingActions += 1;
      setLoading(false);

    } catch (e) {
      print('error completing action');
      print(e);
      setLoading(false);
    }
  }

  // additional methods
  void empty() {
    _userGoals = null;
    _activeGoal = null;
  }
}
