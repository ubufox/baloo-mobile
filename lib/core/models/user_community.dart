class UserCommunity {
  final String _communityId;
  bool _isCurrentMember;
  final String _name;
  final String _city;
  final String _state;
  final bool _isActive;
  int _members;
  final String _imageURL;


  UserCommunity({
    String communityId,
    bool isCurrentMember,
    String name,
    String city,
    String state,
    bool isActive,
    int members,
    String imageURL,
  }) :
    _communityId = communityId,
    _isCurrentMember = isCurrentMember,
    _name = name,
    _city = city,
    _state = state,
    _isActive = isActive,
    _members = members,
    _imageURL = imageURL;


  String get id => _communityId;
  bool get isCurrentMember => _isCurrentMember;
  String get name => _name;
  String get city => _city;
  String get state => _state;
  bool get isActive => _isActive;
  int get members => _members;
  String get imageURL => _imageURL;


  void updateMemberStatus(bool status) {
    _isCurrentMember = status;

    if (status == true) {
      _members += 1;
    } else {
      _members -= 1;
    }
  }


  static UserCommunity fromJSON(Map<String, dynamic> jsonData) {
    bool hasLeft = false;

    if (jsonData['leftAt'] != null) {
      print('left at');
      print(jsonData['leftAt']);
      hasLeft = true;
    }

    return UserCommunity(
      communityId: jsonData['communityId'].toString(),
      isCurrentMember: !hasLeft,
      name: jsonData['communityBycommunityId']['name'],
      city: jsonData['communityBycommunityId']['city'],
      state: jsonData['communityBycommunityId']['state'],
      imageURL: jsonData['communityBycommunityId']['imageURL'],
      isActive: jsonData['communityBycommunityId']['isActive'],
      members: jsonData['communityBycommunityId']['members']['count'],
    );
  }

  static Map<String, dynamic> toJSON(UserCommunity uc) {
    return {
      'communityId': uc.id,
      'isCurrentMember': uc.isCurrentMember.toString(),
      'name': uc.name,
      'city': uc.city,
      'state': uc.state,
      'imageURL': uc.imageURL,
      'isActive': uc.isActive.toString(),
      'members': uc.members.toString(),
    };
  }
}
