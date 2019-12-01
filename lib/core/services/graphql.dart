import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// Services
import 'package:baloo/core/services/storage_access.dart';
import 'package:baloo/core/services/authentication_service.dart';

// Models
import 'package:baloo/core/models/authentication.dart';
import 'package:baloo/core/models/stream_types/client_available.dart';


class GraphQLService {
  AuthenticationService _authService;

  final StorageAccess _storage = StorageAccess();

  final HttpLink httpLink = HttpLink(
    uri: 'http://data.baloo.org/v1/graphql',
  );

  AuthLink _authLink;
  GraphQLClient _client;
  Authentication _authentication;


  GraphQLService({ AuthenticationService authService }) {
    _authService = authService;

    // listen for changes on the state
    // of our authentication
    _authService.jwt.listen((Authentication token) => initClient(token));
  }


  StreamController<ClientAvailable> _hasClientController = StreamController.broadcast();
  Stream<ClientAvailable> get hasClient => _hasClientController.stream;


  // TODO mjf: update name
  // this doesn't describe how it removes the client
  // when a user logs out
  void initClient([Authentication token]) async {
    print('init graphql client');

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
      print('jwt exists in gqls');
      _authentication = jwt;

      _authLink = AuthLink(
        getToken: () => 'Bearer ${jwt.value}',
      );

      final Link link = _authLink.concat(httpLink);

      _client = GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      );

      print('adding client available true to client controller');
      _hasClientController.add(ClientAvailable(true));
    } else {
      _client = null;
      _authentication = null;
      print('adding client available false to client controller');
      _hasClientController.add(ClientAvailable(false));
    }
  }

  Future<QueryResult> runQuery(QueryOptions options) async {
    if (_authentication.value == null) {
      throw('Unauthorized query');
    }
    return await _client.query(options);
  }

  Future<QueryResult> runMutation(MutationOptions options) async {
    if (_authentication.value == null) {
      throw('Unauthorized query');
    }

    return await _client.mutate(options);
  }
}
