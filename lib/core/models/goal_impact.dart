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


  static GoalImpact fromJSON(Map<String, dynamic> json) {
    return GoalImpact(
      material: json['material'],
      amount: double.tryParse(json['amount']),
      unit: json['unit'],
    );
  }
}
