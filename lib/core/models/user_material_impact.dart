class UserMaterialImpact {
  final String _id;
  final String _material;
  final double _amount;
  final String _unit;
  final DateTime _createdAt;


  UserMaterialImpact({
    String id,
    String material,
    double amount,
    String unit,
    DateTime createdAt,
  }) :
    _id = id,
    _material = material,
    _amount = amount,
    _unit = unit,
    _createdAt = createdAt;


  String get id => _id;
  String get material => _material;
  double get amount => _amount;
  String get unit => _unit;
  DateTime get createdAt => _createdAt;
}
