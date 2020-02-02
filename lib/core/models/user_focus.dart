class UserFocus {
  final String _id;
  final String _imperativeMessage;
  List<UserAction> _actions;
  final DateTime _completedAt;


  UserFocus({
    String id,
    String imperativeMessage,
    List<UserAction> actions,
    DateTime completedAt,
  }) :
    _id = id,
    _imperativeMessage = imperativeMessage,
    _actions = actions,
    _completedAt = completedAt;


  String get text => _imperativeMessage;
  List<UserAction> get actions => _actions;
  DateTime get completedAt => _completedAt;
}
