class UserCommunity {
  final int _communityId;
  final bool _hasLeft;
  final String _name;
  final String _city;
  final String _state;
  final bool _isActive;
  final int _members;
  final String _imageURL;


  UserCommunity({
    int communityId,
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


  int get id => _communityId;
  bool get hasLeft => _hasLeft;
  String get name => _name;
  String get city => _city;
  String get state => _state;
  bool get isActive => _isActive;
  int get members => _members;
  String get imageURL => _imageURL;


  static bool fromJSON(Map<String, dynamic> json) {
    return true;
  }
}
