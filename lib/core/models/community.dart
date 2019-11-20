class Community {
  final String _id;
  final String _name;
  final String _city;
  final String _state;
  final String _zipcode;
  final String _imageURL;
  final String _description;
  final DateTime _createdAt;
  final int _members;
  final bool _isMember;


  Community({
    String id,
    String name,
    String city,
    String state,
    String zipcode,
    String imageURL,
    String description,
    DateTime createdAt,
    int members,
    bool isMember,
  }) :
    _id = id,
    _name = name,
    _city = city,
    _state = state,
    _zipcode = zipcode,
    _imageURL = imageURL,
    _description = description,
    _createdAt = createdAt,
    _members = members,
    _isMember = isMember;


  String get id => _id;
  String get name => _name;
  String get city => _city;
  String get state => _state;
  String get zipcode => _zipcode;
  String get imageURL => _imageURL;
  String get description => _description;
  DateTime get createdAt => _createdAt;
  int get members => _members;
  bool get isMember => _isMember;


  static Community fromJSON(Map<String, dynamic> jsonData) {
    Map<String, dynamic> userCommunity = jsonData['userCommunityByCommunityId'][0];
    bool userIsMember = false;

    if (userCommunity != null && userCommunity['leftAt'] == 'null') {
      userIsMember = true;
    }

    return Community(
      id: jsonData['id'].toString(),
      name: jsonData['name'],
      city: jsonData['city'],
      state: jsonData['state'],
      zipcode: jsonData['zipcode'],
      imageURL: jsonData['imageURL'],
      description: jsonData['description'],
      createdAt: DateTime.parse(jsonData['createdAt']),
      members: jsonData['members']['count'],
      isMember: userIsMember,
    );
  }
}
