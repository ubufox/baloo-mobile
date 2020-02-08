import 'package:graphql_flutter/graphql_flutter.dart';


String getUserGoals = """
  query GetUserGoals {
    user_goal {
      id
      userGoalFocusbyUserGoalId {
        userGoalFocusbyUserFocusId {
          userFocusActionsbyUserFocusId {
            userFocusActionbyUserActionId {
              completedAt
              userActionbyActionId {
                firstPersonMessage
                imperativeMessage
                requiredFields
              }
            }
          }
          createdAt
          completedAt
          userFocusbyFocusId {
            imperativeMessage
            id
          }
        }
      }
      completedAt
      communityGoalId
      pausedAt
      isActive
      userGoalbyGoalId {
        goal_impacts {
          material
          unit
          amount
        }
        description
        imperativeMessage
        id
      }
      startedAt
    }
  }
""";


QueryOptions GetUserGoals() => QueryOptions(
  documentNode: gql(getUserGoals),
);
