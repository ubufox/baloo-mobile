class UserAction {
  final String _id;
  final String _imperativeMessage;
  final String _firstPersonMessage;
  List<UserMaterialImpacts> _impact;


  UserAction({
    String id,
    String imperativeMessage,
    String firstPersonMessage,
    List<UserMaterialImpacts> impact,
  }) :
    _id = id,
    _imperativeMessage = imperativeMessage,
    _firstPersonMessage = firstPersonMessage,
    _impact = impact;



  static UserAction fromJSON(Map<String, dynamic> json) {
     // create a list of impacts from the graphql response
    List<UserMaterialImpacts> builtImpacts;

    return UserAction(
      id: json['id'].toString(),
      imperativeMessage: json['imperativeMessage'],
      firstPersonMessage: json['firstPersonMessage'],
      impact: builtImpacts,
    );
  }
}
