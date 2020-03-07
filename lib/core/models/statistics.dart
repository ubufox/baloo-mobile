class Stat {
  final double _amount;
  final String _unit;


  Stat({
    double amount,
    String unit,
  }) :
    _amount = amount,
    _unit = unt;


  double get amount = _amount;
  String get unit = _unit;
}


class Statistics {
  Map<String, Stat> _stats;


  Statistics({
    Map<String, Stat> stats,
  }) : _stats = stats;


  Map<String, Stat> get stats => _stats;

  // TODO mjf
  //   Actually use the json to build the stat;
  static Statistics fromJSON(Map<String, dynamic> json) {
    print('Statistics JSON');
    print(json);

    Stat water = Stat({
      amount: 1393.82,
      unit: 'L',
    });
    Stat carbon = Stat({
      amount: 2.01,
      unit: 'kg',
    });

    return Statistics({
      stats: {
        water: water,
        carbon: carbon,
        actionCount: 3948,
      },
    });
  }
}
