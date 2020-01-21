import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/queries/user_community.dart';
import 'package:baloo/core/services/graphql.dart';

// Models
import 'package:baloo/core/models/user_community.dart';
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/stream_types/client_available.dart';
import 'package:baloo/core/viewmodels/global/base_global_view_model.dart';


class UserCommunitiesViewModel extends BaseGlobalViewModel {
  List<UserCommunity> _userCommunities;


  UserCommunitiesViewModel({ GraphQLService gqls }) : super(gqls: gqls);


  List<UserCommunity> get communities => _userCommunities
    .where((c) => c.isCurrentMember == true)
    .toList();

  int get count => _userCommunities == null ? 0 : _userCommunities
    .where((c) => c.isCurrentMember == true)
    .length;


  @override
  void initialize(ClientAvailable hasClient) async {
    print('initialize user communities model');
    if (hasClient.value == false) {
      isReady = false;
      clearUserCommunities();
    } else {
      setLoading(true);

      try {
        QueryResult result = await gqls.runQuery(GetUserCommunities());
        if (result != null && result.exception == null) {
          _userCommunities = result.data['user_community']
            .map<UserCommunity>(
              (userComm) => UserCommunity.fromJSON(userComm)
            )
            .toList();

          isReady = true;
          setLoading(false);
        } else if (result.exception != null) {
          throw(result.exception.toString());
        }
      } catch(e) {
        print('errors initializing user communities');
        print(e.toString());
        setError(e.toString());
        // TODO mjf: show error on the front end
        // setLoading(false);
      }
    }
  }

  void clearUserCommunities() {
    _userCommunities = null;
    notifyListeners();
  }


  void joinCommunity(String userId, String communityId) async {
    if (isReady == false) {
      throw('User communities unavailable');
    }

    bool isRejoining = _userCommunities
      .where((c) => c.id == communityId)
      .length == 1;

    print('user is rejoining community');

    try {
      QueryResult result;

      // REJOIN USER COMMUNITY
      if (isRejoining == true) {
        result = await gqls.runMutation(
          RejoinCommunityMutation(userId, communityId)
        );

        if (result == null) {
          throw('Failed rejoin request');
        }

        // update matching community
        if (result.exception == null) {
          UserCommunity matchingCommunity = _userCommunities
            .where((c) => c.id == communityId)
            .toList()[0];
          matchingCommunity.updateMemberStatus(true);
        } else {
          throw(result.exception.toString());
        }
      // CREATE NEW USER COMMUNITY
      } else {
        result = await gqls.runMutation(
          JoinCommunityMutation(userId, communityId)
        );

        if (result == null) {
          throw('Failed join request');
        }

        if (result.exception == null) {
          UserCommunity newCommunity = UserCommunity
            .fromJSON(result.data["user_community"][0]);
          _userCommunities.insert(count, newCommunity);
        } else {
          throw(result.exception.toString());
        }
      }

      setLoading(false);

    } catch(e) {
      throw('Error joining community');
      throw(e.toString());
    }
  }

  void leaveCommunity(String userId, String communityId) async {
    if (isReady == false) {
      throw('User communities unavailable');
    }

    try {
      QueryResult result = await gqls.runMutation(
        LeaveCommunityMutation(userId, communityId)
      );

      if (result == null) {
        throw('Failed leave request');
      }

      if (result.exception== null) {
        UserCommunity matchingCommunity = _userCommunities
          .where((c) => c.id == communityId)
          .toList()[0];
        matchingCommunity.updateMemberStatus(false);
      } else {
        throw(result.exception.toString());
      }

      setLoading(false);
    } catch(e) {
      throw('Error leaving community');
      throw(e.toString());
    }
  }
}
