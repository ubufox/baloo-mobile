// The graphql_flutter query templating was conflicting
// with what Hasura expected

String ApplyValues(String query, Map<String, dynamic> data) {
  data.forEach((k, v) => query = query.replaceAll('%s$k', v));
  return query;
}
