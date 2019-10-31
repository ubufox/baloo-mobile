import 'package:flutter/foundation.dart';

import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/models/community.dart';


class CommunitySearchModel extends ChangeNotifier {
  Api _api;

  List<Community> _communities;

  List<Community> get communities => _communities;

  int get length => _communities.length;

  CommunitySearchModel({@required Api api}) {
    _api = api;
    _communities = api.searchCommunities();
  }

  List<Community> searchCommunities([String query, String filter, Function update]) {
    // TODO mjf
    // FILTERS
    // filters should only hit the API if they have not already
    //
    // QUERYING
    // before submission all search queries should use the already fetched communities
    // upon submission the API should be hit
    //
    if (query != null && query != "") {
      _communities = _api.searchCommunities().where((c) =>
        c.name.toLowerCase().contains(query.toLowerCase())
      ).toList();
    } else {
      _communities = _api.searchCommunities();
    }

    notifyListeners();
  }
}
