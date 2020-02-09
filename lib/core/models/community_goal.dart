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
}
