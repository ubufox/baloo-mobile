import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/queries/community.dart';

// Services
import 'package:baloo/core/services/graphql.dart';
import 'package:baloo/core/services/global_data_service.dart';

// Models
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/viewmodels/base_view_model.dart';


class CommunityDetailModel extends BaseViewModel {
  final GraphQLService _gqls;
  final GlobalDataService _ds;
  Community _community;

  CommunityDetailModel({
    GraphQLService gqls,
    GlobalDataService ds
  }) :
    _gqls = gqls,
    _ds = ds;


  Community get community => _community;


  void getCommunity(String id) async {
    setLoading(true);
    Map<String, Community> _communitiesById;
    bool _dsHasCommunities = false;

    try {
      _communitiesById = _ds.getVal(COMMUNITIES_BY_ID_KEY);
      if (_communitiesById != null) {
        _dsHasCommunities = true;
      }

      if (_dsHasCommunities && _communitiesById.containsKey(id)) {
        _community = _communitiesById[id];
        setLoading(false);
      } else {
        throw('Community not available in data service');
      }
    } catch(e) {
      print(e.toString());

      try {
        QueryResult result = await _gqls.runQuery(GetCommunityQuery(id));
        if (result != null && result.errors == null) {
          _community = Community.fromJSON(result.data["community"][0]);
          if (_dsHasCommunities) {
            _communitiesById[id] = _community;
          } else {
            _communitiesById = {
              '$id': _community,
            };
          }
          _ds.upsert(COMMUNITIES_BY_ID_KEY, _communitiesById);
          setLoading(false);
        } else if (result != null) {
          print(result.errors.toString());
        }
      } catch(e) {
        print(e.toString());
      }
    }
  }

  bool isUserCommunity() {
    return false;
  }
}
