import 'package:flutter/foundation.dart';

import 'package:baloo/core/viewmodels/base_view_model.dart';

// Services
import 'package:baloo/core/services/authentication_service.dart';


class CreateAccountModel extends BaseViewModel {
  AuthenticationService _authenticationService;
  String _name;
  String _phone;
  String _zipcode;
  String _code;
  int _onStep = 1;


  CreateAccountModel({
    AuthenticationService authenticationService
  }) : _authenticationService = authenticationService;


  String get name => _name;
  String get phone => _phone;
  String get zipcode => _zipcode;
  int get onStep => _onStep;

  void updateName(String v) {
    _name = v;
  }

  void updatePhone(String v) {
    _phone = v;
  }

  void updateZipcode(String v) {
    _zipcode = v;
  }

  Future<void> createAccount() async {
    setLoading(true);
    bool sent = await _authenticationService.createAccount(_phone);

    if (sent) {
      _onStep = 2;
      setLoading(false);
      notifyListeners();
    }
  }

  void goBack() {
    _onStep --;
    notifyListeners();
  }

  void updateCode(String v) {
    _code = v;
  }

  Future<void> submitConfirmation() async {
    setLoading(true);
    await _authenticationService.confirmAccount(_phone, _code, _name, _zipcode);
    setLoading(false);
  }
}
