import 'package:flutter/foundation.dart';

import 'package:baloo/core/viewmodels/base_view_model.dart';

// Services
import 'package:baloo/core/services/authentication_service.dart';


class LoginModel extends BaseViewModel {
  AuthenticationService _authenticationService;
  String _phone;
  String _code;
  int _onStep = 1;


  LoginModel({
    AuthenticationService authenticationService
  }) : _authenticationService = authenticationService;


  String get phone => _phone;
  String get code => _code;
  int get onStep => _onStep;


  void updatePhone(String v) {
    _phone = v;
  }

  Future<void> submitPhone() async {
    setLoading(true);
    bool sent = await _authenticationService.sendLoginCode(_phone);

    if (sent) {
      _onStep = 2;
      setLoading(false);
    }
  }

  void goBack() {
    _onStep = 1;
    notifyListeners();
  }

  void updateCode(String v) {
    _code = v;
  }

  Future<void> submitConfirmation() async {
    setLoading(true);
    await _authenticationService.confirmLoginCode(_phone, _code);
    setLoading(false);
  }
}
