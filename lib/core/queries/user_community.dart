import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/queries/apply_values.dart';


String joinCommunty = """
  mutation JoinCommunity {
    insert_user_community (objects: {
        userId: %suserId,
        communityId: %scommunityId,
        role: "member",
      }
    ) {
      affected_rows
    }
  }
""";

MutationOptions JoinCommunityMutation(String userId, String communityId) => MutationOptions(
  documentNode: gql(ApplyValues(
    joinCommunty,
    {
      "userId": userId,
      "communityId": communityId,
    },
  ))
);

String rejoinCommunity = """
  mutation RejoinCommunity {
    update_user_community(where: {
      userId: {
        _eq: "%suserId"
      },
      communityId: {
        _eq: "%scommunityId"
      }}, _set: {
        leftAt:null
      }) {
      affected_rows
    }
  }
""";

MutationOptions RejoinCommunityMutation(String userId, String communityId) => MutationOptions(
  documentNode: gql(ApplyValues(
    rejoinCommunity,
    {
      "userId": userId,
      "communityId": communityId,
    },
  ))
);


String leaveCommunity = """
  mutation LeaveCommunity {
    update_user_community(where: {
      userId: {
        _eq: "%suserId"
      },
      communityId: {
        _eq: "%scommunityId"
      }}, _set: {
        leftAt:"%stimestamp"
      }) {
      affected_rows
    }
  }
""";



MutationOptions LeaveCommunityMutation(String userId, String communityId) => MutationOptions(
  documentNode: gql(ApplyValues(
    leaveCommunity,
    {
      "userId": userId,
      "communityId": communityId,
      "timestamp": DateTime.now().toString(),
    },
  )),
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
  documentNode: gql(getUserCommunities),
);
