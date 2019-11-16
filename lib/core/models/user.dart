class User {
  String _name;
  String _zipcode;
  bool _allowSMS;


  User({
    String name,
    String zipcode,
    bool allowSMS,
  }) :
    _name = name,
    _zipcode = zipcode,
    _allowSMS = allowSMS;


  String get name => _name;
  String get zipcode => _zipcode;
  bool get allowSMS => _allowSMS;


  static User fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      zipcode: json['zipcode'],
      allowSMS: json['allowSMS'],
    );
  }
}
