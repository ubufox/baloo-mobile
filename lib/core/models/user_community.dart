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


  static UserCommunity fromJSON(Map<String, dynamic> jsonData) {
    return UserCommunity(
      communityId: jsonData['communityId'].toString(),
      hasLeft: jsonData['leftAt'] == 'null' ,
      name: jsonData['communityBycommunityId']['name'],
      city: jsonData['communityBycommunityId']['city'],
      state: jsonData['communityBycommunityId']['state'],
      imageURL: jsonData['communityBycommunityId']['imageURL'],
      isActive: jsonData['communityBycommunityId']['isActive'],
      members: jsonData['communityBycommunityId']['members']['count'],
    );
  }
}
