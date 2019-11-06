class LoginCredentials {
  String _phone;
  String _code;

  LoginCredentials({
    phone,
    code,
  }) : _phone = phone,
       _code = code;

  String get phone => _phone;
  String get code => _code;
}
