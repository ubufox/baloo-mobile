import 'dart:async';

import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/models/user.dart';


class AuthenticationService {
  final Api _api;
  int currentUserId;

  AuthenticationService({ Api api }) : _api = api;


  StreamController<User> _userController = StreamController<User>();
  Stream<User> get user => _userController.stream;


  Future<bool> sendLoginCode(String phone) async {
    bool sent = await _api.auth.sendLoginCode(phone);
    return sent;
  }

  Future<bool> confirmLoginCode(String phone, String code) async {
    int userId = await _api.auth.confirmLoginCode(phone, code);
    bool loggedIn = await login(userId);

    return loggedIn;
  }


  Future<bool> createAccount(String name, String phone, String zipcode) async {
    bool sent = await _api.auth.createAccount(name, phone, zipcode);
    return sent;
  }


  Future<bool> confirmAccount(String phone, String code) async {
    int userId = await _api.auth.confirmAccount(phone, code);
    if (userId == null) {
      return false;
    }

    bool loggedIn = await login(userId);

    return loggedIn;
  }


  Future<bool> login(int userId) async {
    User fetchedUser = await _api.auth.getUserById(userId);
    currentUserId = fetchedUser.id;

    bool hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    }

    return hasUser;
  }


  Future<bool> logout() async {
    bool loggedOut = await _api.auth.endUserSession(currentUserId);

    if (loggedOut) {
      _userController.add(null);
    }
    return loggedOut;
  }
}
