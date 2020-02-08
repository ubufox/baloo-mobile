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


  static UserAction fromJSON(Map<String, dynamic> json) {
     // create a list of impacts from the graphql response
    List<UserMaterialImpact> builtImpacts;

    return UserAction(
      id: json['id'].toString(),
      imperativeMessage: json['imperativeMessage'],
      firstPersonMessage: json['firstPersonMessage'],
      impact: builtImpacts,
    );
  }
}
