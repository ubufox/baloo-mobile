import 'package:graphql_flutter/graphql_flutter.dart';


String getUser = """
  query GetUser {
    user {
      name
      zipcode
      allowSMS
    }
  }
""";


QueryOptions GetUserQuery() => QueryOptions(
  document: getUser,
);


