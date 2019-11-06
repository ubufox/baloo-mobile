class User {
  int _id;
  String _name;
  String _zipcode;


  User({
    int id,
    String name,
    String zipcode,
  }) :
    _id = id,
    _name = name,
    _zipcode = zipcode;


  int get id => _id;
  String get name => _name;
  String get zipcode => _zipcode;


  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _zipcode = json['zipcode'];
  }
}
