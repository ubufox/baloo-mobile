import 'package:baloo/core/models/user_material_impact.dart';


class UserAction {
  final String _id;
  final String _imperativeMessage;
  final String _firstPersonMessage;
  final DateTime _completedAt;
  List<UserMaterialImpact> _impact = <UserMaterialImpact>[];


  UserAction({
    String id,
    String imperativeMessage,
    String firstPersonMessage,
    DateTime completedAt,
    List<UserMaterialImpact> impact,
  }) :
    _id = id,
    _imperativeMessage = imperativeMessage,
    _firstPersonMessage = firstPersonMessage,
    _completedAt = completedAt,
    _impact = impact;


  String get id => _id;
  String get imperativeMessage => _imperativeMessage;
  String get firstPersonMessage => _firstPersonMessage;
  DateTime get completedAt => _completedAt;
  List<UserMaterialImpact> get impact => _impact;


  static UserAction fromUserFocusJSON(Map<String, dynamic> json) {
    Map<String, dynamic> userActionJSON = json['userFocusActionbyUserActionId'];
    Map<String, dynamic> actionJSON = userActionJSON['userActionbyActionId'];

    DateTime completedTime;
    try {
      completedTime = DateTime.tryParse(userActionJSON['completedAt']);
    } catch (e) {
      // try parse still throws
      completedTime = null;
    }

    return UserAction(
      id: userActionJSON['id'].toString(),
      imperativeMessage: actionJSON['imperativeMessage'],
      firstPersonMessage: actionJSON['firstPersonMessage'],
      completedAt: completedTime,
      impact: <UserMaterialImpact>[],
    );
  }

  // this should use only focus
  static UserAction fromJSON(Map<String, dynamic> json) {
     // create a list of impacts from the graphql response
    List<UserMaterialImpact> builtImpacts;

    return UserAction(
      id: json['id'].toString(),
      imperativeMessage: json['imperativeMessage'],
      firstPersonMessage: json['firstPersonMessage'],
      completedAt: DateTime.parse(json['completedAt']),
      impact: builtImpacts,
    );
  }
}
