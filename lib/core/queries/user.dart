import 'package:graphql_flutter/graphql_flutter.dart';


String getUser = """
  query GetUser {
    user {
      id
      name
      zipcode
      allowSMS
    }
  }
""";


QueryOptions GetUserQuery() => QueryOptions(
  document: getUser,
);
