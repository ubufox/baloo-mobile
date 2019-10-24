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
    _communities = _api.searchCommunities();
  }

  // TODO mjf: add search query and filtering
}
