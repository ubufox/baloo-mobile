class UserImpact {
  double _water;
  double _co2;
  int _actionsCount;

  UserImpact(
    this._water,
    this._co2,
    this._actionsCount,
  );

  double get water  => _water;
  double get co2 => _co2;
  int get actionsCount => _actionsCount;


  void addWater(double amount) {
    _water = _water + amount;
  }

  void addCO2(double amount) {
    _co2 = _co2 + amount;
  }

  void addAction() {
    _actionsCount++;
  }
}
