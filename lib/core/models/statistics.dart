import 'package:flutter/material.dart' hide Focus;

import 'package:baloo/core/models/goal_colors.dart';


class Stat {
  final double _amount;
  final int _actions;
  final String _unit;
  List<Color> _colors;


  Stat({
    double amount,
    int actions,
    String unit,
    List<Color> colors,
  }) :
    _amount = amount,
    _actions = actions,
    _unit = unit,
    _colors = colors;


  double get amount => _amount;
  int get actions => _actions;
  String get unit => _unit;
  List<Color> get colors => _colors;
}


class Statistics {
  Map<String, Stat> _stats;
  int _actionCount;


  Statistics({
    Map<String, Stat> stats,
    int actionCount,
  }) :
    _stats = stats,
    _actionCount = actionCount;


  Map<String, dynamic> get stats => _stats;
  int get actionCount => _actionCount;


  static Statistics fromJSON(Map<String, dynamic> json) {
    print('Statistics JSON');
    print(json);

    Map<String, Stat> builtStats = {};
    json['statistics'].forEach((s) {
      String material = s['material'];
      Stat tempStat = new Stat(
        actions: s['actions'],
        amount: s['amount'],
        unit: s['unit'],
        colors: new GoalColors().getColorByMaterial(s['material']),
      );

      builtStats[material] = tempStat;
    });
    int count = int.tryParse(json['actions']);

    return Statistics(
      stats: builtStats,
      actionCount: count,
    );
  }
}
