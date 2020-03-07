class GoalImpact {
  final String _material;
  final double _amount;
  final String _unit;


  GoalImpact({
    String material,
    double amount,
    String unit,
  }) :
    _material = material,
    _amount = amount,
    _unit = unit;


  String get material => _material;
  double get amount => _amount;
  String get unit =>_unit;


  static GoalImpact fromJSON(Map<String, dynamic> json) {
    return GoalImpact(
      material: json['material'],
      amount: double.tryParse(json['amount']),
      unit: json['unit'],
    );
  }
}
