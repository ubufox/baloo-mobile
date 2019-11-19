import 'package:graphql_flutter/graphql_flutter.dart';


String joinCommunty = """
  mutation JoinCommunity(\$userId: ID!, \$communityId: ID!) {
    insert user_community (objects: {
        userId: \$userId,
        communityId: \$communityId,
        role: "member",
      }
    )
  }
""";

MutationOptions JoinCommunityMutation(String userId, String communityId) => MutationOptions(
  document: joinCommunty,
  variables: {
    'userId': userId,
    'communityId': communityId,
  },
);


String getUserCommunities = """
  query GetUserCommunities {
    user_community {
      communityBycommunityID {
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
