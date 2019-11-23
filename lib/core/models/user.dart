class User {
  String _id;
  String _name;
  String _zipcode;
  bool _allowSMS;


  User({
    String id,
    String name,
    String zipcode,
    bool allowSMS,
  }) :
    _id = id,
    _name = name,
    _zipcode = zipcode,
    _allowSMS = allowSMS;


  String get id => _id;
  String get name => _name;
  String get zipcode => _zipcode;
  bool get allowSMS => _allowSMS;


  static User fromJSON(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'],
      zipcode: json['zipcode'],
      allowSMS: json['allowSMS'],
    );
  }
}
