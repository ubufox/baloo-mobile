// having a named type allows children widgets
// to get this through the provider without getting
// closer but unrelated Strings
class Authentication {
  bool _value;

  Authentication(String value) : _value : value;

  String get value => _value;
  void set value(String v) {
    _value = v;
  }
}
