import 'package:flutter/material.dart';


class Goal {
  final int _id;
  final String _title;
  final String _description;
  final String _focus; // this will be dynamic and change weekly
  final int _progress;
  final List<Color> _colors;

  Goal(
    this._id,
    this._title,
    this._description,
    this._focus,
    this._progress,
    this._colors,
  );

  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get focus => _focus;
  int get progress => _progress;
  List<Color> get colors => _colors;
}
