import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:baloo/core/queries/apply_values.dart';


String getCommunity = """
  query GetCommunity {
    community(where: {id: {_eq: %scommunity_id }}) {
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
      userCommunityByCommunityId {
        leftAt
      }
    }
  }
""";


QueryOptions GetCommunityQuery(String id) => QueryOptions(
  documentNode: gql(ApplyValues(getCommunity, {"community_id": id})),
);

// TODO mjf
//   return community goals
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
      userCommunityByCommunityId {
        leftAt
      }
    }
  }
""";


QueryOptions GetCommunitiesQuery() => QueryOptions(
  documentNode: gql(getCommunities),
);
