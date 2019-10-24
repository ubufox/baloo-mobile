import 'package:flutter/foundation.dart';

import 'package:baloo/core/models/community.dart';


class UserCommunitiesState {
  final List<Community> userCommunities;

  const UserCommunitiesState(this.userCommunities);
}


class UserCommunitiesNotifier with ChangeNotifier {
  UserCommunitiesState _currentUserComms = UserCommunitiesState([]);

  List<Community> get userCommunities => _currentUserComms.userCommunities;

  UserCommunitiesNotifier() {
    _initializeCommunities();
  }

  void _initializeCommunities() {
    // could pull user communities API data here instead of using static data
    Community initCommunities = new Community(
      101,
      "Grand View Farmer's Market",
      '888 members',
      'Los Angeles, CA',
      'assets/images/default_community.jpg',
      'About text',
    );

    _currentUserComms = UserCommunitiesState([initCommunities]);
  }

  bool inUserCommunities(Community comm) {
    Iterable<Community> alreadyInList = _currentUserComms.userCommunities.where((e) => e.getId == comm.getId);
    return alreadyInList.length > 0;
  }

  void joinCommunity(Community newCommunity) {
    // prevent duplicate communities
    if (!inUserCommunities(newCommunity)) {
      print('joining community ' + newCommunity.getId.toString());
      _currentUserComms.userCommunities.insert(_currentUserComms.userCommunities.length, newCommunity);
      print('communities length : ' + _currentUserComms.userCommunities.length.toString());
      notifyListeners();
    }
  }

  void leaveCommunity(Community communityToLeave) {
    _currentUserComms.userCommunities.remove(communityToLeave);
    print('communities length : ' + _currentUserComms.userCommunities.length.toString());
    notifyListeners();
  }
}
