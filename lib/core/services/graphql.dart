import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/services/storage_access.dart';
import 'package:baloo/core/services/authentication_service.dart';


class GraphQLService {
  AuthenticationService _auth;

  final HttpLink httpLink = HttpLink(
    uri: 'https://data.baloo.org/v1/graphql',
  );
  AuthLink _authLink;
  GraphQLClient _client;

  bool _hasClient;
  Authentication _authentication;


  GraphQLService({ AuthenticationService auth }) {
    _hasClient = false;
    _authentication = null;
    _auth = auth;

    initClient();

    // listen for changes on the state
    // of our authentication
    _auth.jwt.listen((Authentication token) => {
      initClient(token);
    });
  }


  GraphQLClient get client => _client;
  bool get hasClient => _hasClient;
  Authentication get authentication => authentication;


  // TODO mjf: update name
  // this doesn't describe how it removes the client
  // when a user logs out
  void initClient([Authentication token]) async {
    Authentication jwt;
    if (token) {
      jwt = token;
    } else {
      jwt = await _storage.getJWT();
    }

    if (jwt != null) {
      _isAuthorized = true;

      _authLink = AuthLink(
        getToken: () => 'Bearer ${jwt}',
      );

      final Link link = _authLink.concat(httpLink);

      _client = GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      );

      _hasClient = true;
    } else {
      _client = null;
      _authentication = null;
      _hasClient = false;
    }
  }

  Future<QueryResult> runQuery(QueryOptions options) async {
    if (_hasClient && _isAuthorized) {
      return await _client.query(options);
    } else {
      if (!_hasClient) {
        throw('Client unavailable');
      } else {
        throw('Unauthorized query');
      }
    }
  }
}
