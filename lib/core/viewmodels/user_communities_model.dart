import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/queries/user_community.dart';

// Services
import 'package:baloo/core/services/graphql.dart';
import 'package:baloo/core/services/global_data_service.dart';

// Models
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/user_community.dart';
import 'package:baloo/core/viewmodels/base_view_model.dart';


class UserCommunitiesModel extends BaseViewModel {
  final GraphQLService _gqls;
  final GlobalDataService _ds;
  List<UserCommunity> _communities;


  UserCommunitiesModel({
    GraphQLService gqls,
    GlobalDataService ds
  }) :
    _gqls = gqls,
    _ds = ds;


  List<UserCommunity> get communities => _communities;
  int get length => _communities.length;


  void getUserCommunities() async {
    if (_communities == null) {
      setLoading(true);
      try {
        _communities = _ds.getVal(USER_COMMUNITIES_KEY);
        setLoading(false);
      } catch(e) {
        print(e.toString());

        try {
          QueryResult result = await _gqls.runQuery(GetUserCommunities());
          print('result');
          print(result.toString());

          if (result != null && result.errors == null) {
            print('result');
            print(result.data.toString());

            _communities = UserCommunity.communitiesFromJSON(result.data['user_community']);
            _ds.upsert(USER_COMMUNITIES_KEY, _communities);
            setLoading(false);
          } else if (result != null) {
            print('result errors');
            print(result.errors.toString());
          }
        } catch(e) {
          print(e.toString());
        }
      }
    }
  }

  void joinCommunity(String communityId) {
    // if (!inUserCommunities(newCom)) {
    //   _communities.insert(length, newCom);
    //   notifyListeners();
    // }
  }

  void leaveCommunity(String communityId) {
    // if (inUserCommunities(com)) {
    //   _communities.remove(com);
    //   notifyListeners();
    // }
  }
}
