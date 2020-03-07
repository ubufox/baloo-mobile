import 'package:baloo/core/models/user_focus.dart';
import 'package:baloo/core/models/goal_impact.dart';


class UserGoal {
  final String _id;
  final String _goalId;
  final String _description;
  final String _imperativeMessage;
  final DateTime _startedAt;
  DateTime _completedAt;
  bool _isActive;
  List<UserFocus> _focuses = <UserFocus>[];
  List<GoalImpact> _goalImpacts = <GoalImpact>[];
  int _progress;


  UserGoal({
    String id,
    String goalId,
    String description,
    String imperativeMessage,
    DateTime startedAt,
    DateTime completedAt,
    bool isActive,
    List<UserFocus> focuses,
    List<GoalImpact> goalImpacts,
  }) :
    _id = id,
    _goalId = goalId,
    _description = description,
    _imperativeMessage = imperativeMessage,
    _startedAt = startedAt,
    _completedAt = completedAt,
    _isActive = isActive,
    _focuses = focuses,
    _goalImpacts = goalImpacts,
    _progress = 0;


  String get goalId => _goalId;
  String get description => _description;
  String get text => _imperativeMessage;
  DateTime get startedAt => _startedAt;
  DateTime get completedAt => _completedAt;
  bool get isActive => _isActive;
  List<UserFocus> get focuses => _focuses;
  List<GoalImpact> get impact => _goalImpacts;
  int get progress => _progress;
  // TODO: mjf
  //   use focus position instead of created timestamp
  //   sort definition on line 88
  UserFocus get nextFocus => getNextFocus();

  void set isActive(bool val) {
    _isActive = val;
  }


  // JSON STRUCTURE MATCHES GRAPHQL IN USER_GOAL QUERY FILE
  static UserGoal fromJSON(Map<String, dynamic> json) {
    DateTime completedTime;
    try {
      completedTime = DateTime.tryParse(json['completedAt']);
    } catch (e) {
      // try parse still throws
      completedTime = null;
    }

    List<GoalImpact> builtImpacts = json['userGoalbyGoalId']['goal_impacts']
      .map<GoalImpact>((gi) => GoalImpact.fromJSON(gi))
      .toList();
    List<UserFocus> builtFocuses = json['userGoalFocusbyUserGoalId']
      .map<UserFocus>((f) => UserFocus.fromUserGoalJSON(f))
      .toList();

    return UserGoal(
      id: json['id'].toString(),
      goalId: json['userGoalbyGoalId']['id'].toString(),
      description: json['userGoalbyGoalId']['description'],
      imperativeMessage: json['userGoalbyGoalId']['imperativeMessage'],
      startedAt: DateTime.parse(json['startedAt']),
      completedAt: completedTime,
      isActive: json['isActive'],
      focuses: builtFocuses,
      goalImpacts: builtImpacts
    );
  }

  UserFocus getNextFocus() {
    _focuses.sort(sortByCreatedAt);

    List<UserFocus> incompleteFocuses = _focuses
      .where((UserFocus f) => f.completedAt == null)
      .toList();

    if (incompleteFocuses.length == 0) {
      return _focuses[0];
    }

    return incompleteFocuses[0];
  }

  int sortByCreatedAt(UserFocus a, UserFocus b) {
    if (a.createdAt.millisecond > b.createdAt.millisecond) {
      return 1;
    } else if (a.createdAt.millisecond == b.createdAt.millisecond) {
      return 0;
    }
    return -1;
  }

}
