import 'package:graphql_flutter/graphql_flutter.dart';


String getGoals = """
  query GetGoals {
    goal(where: {isPrivate: {_eq: false}}) {
      id
      imperativeMessage
      zipcode
      type
      createdAt
      goal_focuses {
        focusByfocusId {
          id
          imperativeMessage
        }
      }
      goal_impacts {
        amount
        material
        unit
      }
    }
  }
""";


QueryOptions GetGoalsQuery() => QueryOptions(
  documentNode: gql(getGoals),
);
