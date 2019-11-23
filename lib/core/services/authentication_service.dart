import 'dart:async';

import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/services/storage_access.dart';

import 'package:baloo/core/models/authentication.dart';


class AuthenticationService {
  Api _api;
  final _storage = StorageAccess();


  AuthenticationService({ Api api }) {
    _api = api;
    _initAuthentication();
  }


  // graphql and the streamprovider listens to this stream
  // so it must be a broadcast streamcontroller
  StreamController<Authentication> _jwtController = StreamController.broadcast();
  Stream<Authentication> get jwt => _jwtController.stream;


  void _initAuthentication() async {
    String t = await _storage.getJWT();

    if (t != null) {
      Authentication token = Authentication(t);
      _jwtController.add(token);
    } else {
      _jwtController.add(null);
    }
  }

  Future<bool> sendLoginCode(String phone) async {
    bool sent = await _api.auth.sendLoginCode(phone);
    return sent;
  }

  Future<void> confirmLoginCode(String phone, String code) async {
    String t = await _api.auth.confirmLoginCode(phone, code);

    Authentication jwt = Authentication(t);
    if (jwt != null) {
      _storage.storeJWT(jwt.value);
      _jwtController.add(jwt);
    }
  }

  Future<bool> createAccount(String phone) async {
    bool success = await _api.auth.beginAccountCreation(phone);
    return success;
  }

  Future<void> confirmAccount(String phone, String code, String name, String zipcode) async {
    String t = await _api.auth.confirmAccount(phone, code, name, zipcode);

    Authentication jwt = Authentication(t);
    if (jwt != null) {
      _storage.storeJWT(jwt.value);
      _jwtController.add(jwt);
    }
  }

  Future<void> logout() async {
    _jwtController.add(null);
    _storage.deleteJWT();
  }
}
