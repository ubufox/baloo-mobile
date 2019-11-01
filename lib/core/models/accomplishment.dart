import 'package:flutter/material.dart';


class Accomplishment {
  final String _title;
  final String _description;
  final DateTime _started;
  final DateTime _completed;
  final double _water;
  final double _co2;
  final double _plastic;
  final int _actionCount;
  final String _type;
  final List<Color> _colors;

  Accomplishment(
    this._title,
    this._description,
    this._started,
    this._completed,
    this._water,
    this._co2,
    this._plastic,
    this._actionCount,
    this._type,
    this._colors,
  );

  String get title => _title;
  String get description => _description;
  DateTime get started => _started;
  DateTime get completed => _completed;
  double get water => _water;
  double get co2 => _co2;
  double get plastic => _plastic;
  int get actionCount => _actionCount;
  String get type => _type;
  List<Color> get colors => _colors;
}
