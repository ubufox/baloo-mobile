import 'package:graphql_flutter/graphql_flutter.dart';

// Services
import 'package:baloo/core/services/graphql.dart';

// Models
import 'package:baloo/core/models/user_goal.dart';
import 'package:baloo/core/models/user_focus.dart';
import 'package:baloo/core/models/user_action.dart';
import 'package:baloo/core/models/stream_types/client_available.dart';
import 'package:baloo/core/viewmodels/global/base_global_view_model.dart';

// Queries
import 'package:baloo/core/queries/user_goals.dart';


// Gets the user's goals, focuses, actions
class EngagementViewModel extends BaseGlobalViewModel {
  // Define required properties
  List<UserGoal> _userGoals;
  List<UserFocus> _userFocuses;
  List<UserAction> _userActions;

  EngagementViewModel({ GraphQLService gqls }) : super(gqls: gqls);

  // Getters and Setters
  UserGoal get activeGoal => _userGoals
    .firstWhere((g) => g.isActive, orElse: () => null);
  UserFocus get currentFocus => activeGoal
    .focuses
    .firstWhere((f) => f.completedAt == null, orElse: () => null);
  UserAction get currentAction => currentFocus
    .actions
    .firstWhere((a) => a.completedAt == null, orElse: () => null);


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
          print('engagement results');
          print(result.data.toString());
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

  UserGoal getUserGoalById(String goalId) {
    UserGoal result = _userGoals.firstWhere(
      (goal) => goal.goalId == goalId,
      orElse: () => null,
    );

    return result;
  }


  // additional methods
  void empty() {
    _userGoals = null;
    _userFocuses = null;
    _userActions = null;
  }
}
