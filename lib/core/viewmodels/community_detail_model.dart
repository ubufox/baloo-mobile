import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/queries/community.dart';
import 'package:baloo/core/queries/user.dart';
import 'package:baloo/core/queries/user_community.dart';

// Services
import 'package:baloo/core/services/graphql.dart';
import 'package:baloo/core/services/global_data_service.dart';

// Models
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/user.dart';
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

    // get the community from the global state
    try {
      _communitiesById = _ds.getVal(COMMUNITIES_BY_ID_KEY);
      if (_communitiesById != null) {
        _dsHasCommunities = true;
      }

      if (_dsHasCommunities && _communitiesById.containsKey(id)) {
        print('community keys');
        print(_communitiesById.keys.toString());

        _community = _communitiesById[id];
        setLoading(false);
      } else {
        throw('Community not available in data service');
      }
    } catch(e) {
      // global state didn't have the community we're looking for
      print(e.toString());

      try {
        QueryResult result = await _gqls.runQuery(GetCommunityQuery(id));

        if (result != null && result.errors == null) {
          print('data');
          print(result.data);

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

  Future<void> updateMemberStatus() async {
    print('update member status');
    User _user;

    try {
      _user = _ds.getVal(USER_KEY);
      print('got user');
    } catch(e) {
      QueryResult uRes = await _gqls.runQuery(GetUserQuery());

      if (uRes!= null && uRes.errors == null) {
        _user = User.fromJSON(uRes.data["user"][0]);
        print('user from query');
        print(_user.toString());

        DateTime userExpires = DateTime.now().add(
          Duration(days: 1)
        );
        _ds.upsert(USER_KEY, _user, userExpires);
      } else if (uRes.errors != null) {
        print(uRes.errors.toString());
        throw(uRes.errors.toString());
      }
    }

    print('isMember ' + _community.isMember.toString());

    if (_community.isMember) {
      print('leave community');
      print(Community.toJSON(_community));


      // leave community
      try {
        QueryResult result = await _gqls.runMutation(
          LeaveCommunityMutation(_user.id, _community.id)
        );

        if (result != null && result.errors == null) {
          print('affected rows');
          print(result.data);

          _community.isMember = false;

          // force reload on next user community view
          _ds.expireVal(USER_COMMUNITIES_KEY);
        } else if (result.errors != null) {
          print('result erros');
          print(result.errors.toString());
        }
      } catch(e) {
        print('error leaving community');
        print(e.toString());
      }

    } else {
      print('join community');
      QueryResult result = await _gqls.runMutation(
        JoinCommunityMutation(_user.id, _community.id)
      );

      _community.isMember = true;

      // force reload on next user community view
      _ds.expireVal(USER_COMMUNITIES_KEY);
    }
  }
}
