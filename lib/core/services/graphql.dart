import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// Services
import 'package:baloo/core/services/storage_access.dart';
import 'package:baloo/core/services/authentication_service.dart';

// Models
import 'package:baloo/core/models/authentication.dart';


class GraphQLService {
  AuthenticationService _authService;
  final StorageAccess _storage = StorageAccess();

  final HttpLink httpLink = HttpLink(
    uri: 'http://data.baloo.org/v1/graphql',
  );

  AuthLink _authLink;
  GraphQLClient _client;

  bool _hasClient;
  Authentication _authentication;


  GraphQLService({ AuthenticationService authService }) {
    _hasClient = false;
    _authentication = null;
    _authService = authService;

    initClient();

    // listen for changes on the state
    // of our authentication
    _authService.jwt.listen((Authentication token) => initClient(token));
  }


  GraphQLClient get client => _client;
  bool get hasClient => _hasClient;
  Authentication get authentication => _authentication;


  // TODO mjf: update name
  // this doesn't describe how it removes the client
  // when a user logs out
  void initClient([Authentication token]) async {
    Authentication jwt;
    if (token != null) {
      jwt = token;
    } else {
      String t = await _storage.getJWT();
      if (t != null) {
        jwt = Authentication(t);
      }
    }

    if (jwt != null) {
      _authentication = jwt;

      _authLink = AuthLink(
        getToken: () => 'Bearer ${jwt.value}',
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
    if (_hasClient && _authentication.value != null) {
      return await _client.query(options);
    } else {
      if (!_hasClient) {
        throw('Client unavailable');
      } else {
        throw('Unauthorized query');
      }
    }
  }

  // TODO mjf: add mutation
}
