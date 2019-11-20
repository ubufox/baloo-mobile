import 'dart:convert';


class UserCommunity {
  final String _communityId;
  final bool _hasLeft;
  final String _name;
  final String _city;
  final String _state;
  final bool _isActive;
  final int _members;
  final String _imageURL;


  UserCommunity({
    String communityId,
    bool hasLeft,
    String name,
    String city,
    String state,
    bool isActive,
    int members,
    String imageURL,
  }) :
    _communityId = communityId,
    _hasLeft = hasLeft,
    _name = name,
    _city = city,
    _state = state,
    _isActive = isActive,
    _members = members,
    _imageURL = imageURL;


  String get id => _communityId;
  bool get hasLeft => _hasLeft;
  String get name => _name;
  String get city => _city;
  String get state => _state;
  bool get isActive => _isActive;
  int get members => _members;
  String get imageURL => _imageURL;


  static List<UserCommunity> communitiesFromJSON(List<Map<String, dynamic>> jsonData) {
    // final List<Map<String, dynamic>> parsedJson = json.decode(jsonData);
    // print('$parsedJson');

    return jsonData.map((comm) =>
      UserCommunity(
        communityId: comm['communityId'],
        hasLeft: comm['leftAt'] == 'null' ,
        name: comm['communityBycommunityId']['name'],
        city: comm['communityBycommunityId']['city'],
        state: comm['communityBycommunityId']['state'],
        imageURL: comm['communityBycommunityId']['imageURL'],
        isActive: comm['communityBycommunityId']['isActive'],
        members: int.parse(comm['communityBycommunityId']['memebers']['count']),
      )
    ).toList();
  }
}
