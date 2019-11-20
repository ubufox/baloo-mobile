import 'package:graphql_flutter/graphql_flutter.dart';


String getCommunity = """
  query GetCommunity(\$communityId: ID!) {
    community(where: {
      id: {
        _eq: "\$communityId"
      }
    }) {
      id
      name
      city
      state
      imageURL
      zipcode
      description
      createdAt
      members {
        count
      }
      userCommunityByCommunity {
        leftAt
      }
    }
  }
""";


QueryOptions GetCommunityQuery(String id) => QueryOptions(
  document: getCommunity,
  variables: {
    'communityId': id,
  },
);


String getCommunities = """
  query GetCommunities {
    community(where: {
      isActive: {
        _eq: true
      }
    }) {
      id
      name
      city
      state
      imageURL
      description
      zipcode
      createdAt
      members {
        count
      }
      userCommunityByCommunity {
        leftAt
      }
    }
  }
""";


QueryOptions GetCommunitiesQuery() => QueryOptions(
  document: getCommunities,
);
