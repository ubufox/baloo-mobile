import 'package:baloo/core/models/new_goal.dart';


class CommunityGoal {
  final String _id;
  final String _communityId;
  final DateTime _startedAt;
  final DateTime _completedAt;
  final DateTime _pausedAt;
  final int _targetEngagement;
  final NewGoal _goal;


  CommunityGoal(
    String id,
    String communityId,
    DateTime startedAt,
    DateTime completedAt,
    DateTime pausedAt,
    int targetEngagement,
    NewGoal goal,
  ) :
    _id = id,
    _communityId = communityId,
    _startedAt = startedAt,
    _completedAt = completedAt,
    _pausedAt = pausedAt,
    _targetEngagement = targetEngagement,
    _goal = goal;


  String get id => _id;
  String get communityId => _communityId;
  DateTime get startedAt => _startedAt;
  DateTime get completedAt => _completedAt;
  DateTime get pausedAt => _pausedAt;
  int get targetEngagement => _targetEngagement;
  NewGoal get goal => _goal;


 // TODO mjf:
 //   add fromJSON to construct from GQL response
}
