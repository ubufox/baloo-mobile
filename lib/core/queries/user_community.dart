import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/queries/apply_values.dart';


String joinCommunty = """
  mutation JoinCommunity {
    insert user_community (objects: {
        userId: %suserId,
        communityId: %scommunityId,
        role: "member",
      }
    )
  }
""";

MutationOptions JoinCommunityMutation(String userId, String communityId) => MutationOptions(
  document: ApplyValues(
    joinCommunty,
    {
      "userId": userId,
      "communityId": communityId,
    },
  )
);


String leaveCommunity = """
  mutation MyMutation {
    update_user_community(where: {
      userId: {
        _eq: %suserId
      },
      communityId: {
        _eq: %scommmunityId
      }
    }, _set: {
      leftAt: %stimestamp
    }) {
      affected_rows
    }
  }
""";

MutationOptions LeaveCommunityMutation(String userId, String communityId) => MutationOptions(
  document: ApplyValues(
    leaveCommunity,
    {
      "userId": userId,
      "communityId": communityId,
      "timestamp": DateTime.now().toString(),
    },
  ),
);


String getUserCommunities = """
  query GetUserCommunities {
    user_community {
      communityBycommunityId {
        city
        imageURL
        name
        state
        isActive
        members {
          count
        }
      }
      communityId
      leftAt
    }
  }
""";

QueryOptions GetUserCommunities() => QueryOptions(
  document: getUserCommunities,
);
