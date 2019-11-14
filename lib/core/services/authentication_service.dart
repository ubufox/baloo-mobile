import 'dart:async';

import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/services/storage_access.dart';

import 'package:baloo/core/models/user.dart';
import 'package:baloo/core/models/authentication.dart';


class AuthenticationService {
  final Api _api;
  final _storage = StorageAccess();


  AuthenticationService({ Api api }) {
    _api = api;
    _initAuthentication();
  }


  StreamController<User> _userController = StreamController<User>();
  Stream<User> get user => _userController.stream;

  StreamController<Authentication> _jwtController = StreamController<Authentication>();
  Stream<Authentication> get jwt => _jwtController.stream;


  void _initAuthentication() async {
    Authentication token = await _storage.getJWT();
    if (token != null) {
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
    Authentication jwt = await _api.auth.confirmLoginCode(phone, code);
    if (jwt != null) {
      _jwtController.add(jwt);
    }
  }

  Future<bool> createAccount(String phone) async {
    bool success = await _api.auth.beginAccountCreation(phone);
    return success;
  }

  Future<void> confirmAccount(String phone, String code, String name, String zipcode) async {
    Authentication jwt = await _api.auth.confirmAccount(phone, code, name, zipcode);
    if (jwt != null) {
      _jwtController.add(jwt);
    }
  }

  Future<void> logout() async {
    _jwtController.add(null);
  }
}
