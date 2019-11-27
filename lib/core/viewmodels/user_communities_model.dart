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

  // model initialization
  // create observer for specific key
  // screen should call getUserCommunities
  // which should either hydrate with existing data
  // or call the pull

  List<UserCommunity> get communities => _communities
    .where((c) => c.isCurrentMember == true)
    .toList();

  int get count => _communities == null ? 0 : _communities
    .where((c) => c.isCurrentMember == true)
    .length;


  void getUserCommunities() async {
    setLoading(true);
    print('updating user communities');

    try {
      _communities = _ds.getVal(USER_COMMUNITIES_KEY);
      setLoading(false);
    } catch(e) {
      print(e.toString());

      try {
        QueryResult result = await _gqls.runQuery(GetUserCommunities());

        if (result != null && result.errors == null) {
          _communities = result.data['user_community'].map<UserCommunity>(
            (userComm) => UserCommunity.fromJSON(userComm)
          ).toList();

          _communities.forEach((c) {
            print(c.name);
            print(UserCommunity.toJSON(c));
          });

          _ds.upsert(USER_COMMUNITIES_KEY, _communities);
          _ds.observe(USER_COMMUNITIES_KEY, updateCommunities);
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

  void updateCommunities(List<UserCommunity> updates) {
    _communities = updates;
  }
}
