class UserGoal {
  final String _id;
  final String _description;
  final String _imperativeMessage;
  final DateTime _startedAt;
  DateTime _completedAt;
  bool _isActive;
  List<UserFocus> _focuses;
  List<GoalImpact> _goalImpacts;


  UserGoal({
    String id,
    String description,
    String imperativeMessage,
    DateTime startedAt,
    DateTime completedAt,
    bool isActive,
    List<UserFocus> focuses,
    List<GoalImpact> goalImpacts,
  }) :
    _id = id,
    _description = description,
    _imperativeMessage = imperativeMessage,
    _startedAt = startedAt,
    _completedAt = completedAt,
    _isActive = isActive,
    _focuses = focuses,
    _goalImpacts = goalImpacts;


  String get description => _description;
  String get text => _imperativeMessage;
  DateTime get startedAt => _startedAt;
  DateTime get completedAt => _completedAt;
  bool get isActive => _isActive;
  List<UserFocus> focuses => _focuses;
  List<GoalImpact> impact => _goalImpacts;


  // JSON STRUCTURE MATCHES GRAPHQL IN USER_GOAL QUERY FILE
  static UserGoal fromJSON(Map<String, dynamic> json) {
    return UserGoal(
      id: json['id'].toString(),
      startedAt: json['startedAt'],
      completedAt: json['completedAt'],
      isActive: json['isActive'],
    );
  }
}
