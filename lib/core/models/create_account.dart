class CreateAccount {
  String _name;
  String _zipcode;
  String _phone;
  String _code = "";

  CreateAccount(
    this._name,
    this._zipcode,
    this._phone,
  );

  String get name => _name;
  String get zipcode => _zipcode;
  String get phone => _phone;
  String get code => _code;

  void setCode(String code) {
    _code = code;
  }
}
