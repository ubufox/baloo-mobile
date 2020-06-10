import 'package:baloo/core/models/community_goal.dart';

class Community {
  final String _id;
  final String _name;
  final String _city;
  final String _state;
  final String _zipcode;
  final String _imageURL;
  final String _description;
  final DateTime _createdAt;
  int _members;
  bool _isMember;
  List<CommunityGoal> _goals = <CommunityGoal>[];
  CommunityGoal _currentGoal;


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
    List<CommunityGoal> goals,
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
    _isMember = isMember,
    _goals = goals;


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
  List<CommunityGoal> get goals => _goals.where((g) => g.completedAt == null);
  List<CommunityGoal> get accomplishments => _goals.where((g) => g.completedAt != null).toList();
  CommunityGoal get currentGoal => _currentGoal != null ? _currentGoal : getCurrentGoal();


  void set isMember(bool val) {
    _isMember = val;
  }

  void set members(int val) {
    _members = val;
  }


  CommunityGoal getCurrentGoal() {
    // goals that have not been started will not appear in the goals list
    _currentGoal = _goals.firstWhere(
      (g) => g.completedAt == null && g.pausedAt == null,
      orElse: () => null,
    );

    return _currentGoal;
  }

  static Community fromJSON(Map<String, dynamic> jsonData) {
    Map<String, dynamic> userCommunity = jsonData['userCommunityByCommunityId'][0];

    List<CommunityGoal> builtGoals = jsonData['community_goals']
      .map<CommunityGoal>((cg) => CommunityGoal.fromJSON(cg))
      .toList();

    print('successfully built goals');

    bool userIsMember = false;

    if (userCommunity != null && userCommunity['leftAt'] == null) {
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
      members: int.tryParse(jsonData['members']['count']),
      isMember: userIsMember,
      goals: builtGoals,
    );
  }

  static Map<String, dynamic> toJSON(Community c) {
    return {
      'id': c.id,
      'name': c.name,
      'city': c.city,
      'state': c.state,
      'zipcode': c.zipcode,
      'imageURL': c.imageURL,
      'description': c.description,
      'createdAt': c.createdAt.toString(),
      'members': c.members.toString(),
      'isMember': c.isMember.toString(),
      'goals': c.goals.toString(),
    };
  }
}
