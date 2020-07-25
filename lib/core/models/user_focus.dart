import 'package:baloo/core/models/user_action.dart';


class UserFocus {
  final String _imperativeMessage;
  List<UserAction> _actions = <UserAction>[];
  final DateTime _createdAt;
  final DateTime _completedAt;
  final int _position;


  UserFocus({
    String imperativeMessage,
    List<UserAction> actions,
    DateTime createdAt,
    DateTime completedAt,
    int position,
  }) :
    _imperativeMessage = imperativeMessage,
    _actions = actions,
    _createdAt = createdAt,
    _completedAt = completedAt,
    _position = position;


  String get text => _imperativeMessage;
  List<UserAction> get actions => _actions;
  DateTime get createdAt => _createdAt;
  DateTime get completedAt => _completedAt;
  int get position => _position;


  static UserFocus fromUserGoalJSON(Map<String, dynamic> json) {
    Map<String, dynamic> userFocusJSON = json['userGoalFocusbyUserFocusId'];
    Map<String, dynamic> focusJSON = userFocusJSON['userFocusbyFocusId'];

    Map<String, dynamic> goalFocusJSON = json['goalFocusByGoalFocusId'];

    DateTime completedTime;
    try {
      completedTime = DateTime.tryParse(userFocusJSON['completedAt']);
    } catch (e) {
      // try parse still throws
      completedTime = null;
    }

    List<UserAction> builtActions = userFocusJSON['userFocusActionsbyUserFocusId']
      .map<UserAction>((a) => UserAction.fromUserFocusJSON(a))
      .toList();

    return UserFocus(
      imperativeMessage: focusJSON['imperativeMessage'],
      actions: builtActions,
      createdAt: DateTime.parse(userFocusJSON['createdAt']),
      completedAt: completedTime,
      position: goalFocusJSON['position'],
    );
  }
}
