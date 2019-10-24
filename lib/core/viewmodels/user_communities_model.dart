import 'package:flutter/foundation.dart';

import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/models/community.dart';


class UserCommunitiesModel extends ChangeNotifier {
  Api _api;

  List<Community> _communities;

  List<Community> get communities => _communities;
  int get length => _communities.length;

  UserCommunitiesModel({@required Api api}) {
     _api = api;
     _communities = _api.getUserCommunities();
  }

  bool inUserCommunities(Community comm) {
    Iterable<Community> alreadyInList = _communities.where((e) => e.id == comm.id);
    return alreadyInList.length > 0;
  }

  void joinCommunity(Community newCom) {
    if (!inUserCommunities(newCom)) {
      _communities.insert(length, newCom);
      notifyListeners();
    }
  }

  void leaveCommunity(Community com) {
    if (inUserCommunities(com)) {
      _communities.remove(com);
      notifyListeners();
    }
  }
}
