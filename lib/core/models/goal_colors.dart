import 'package:flutter/material.dart';

import 'package:baloo/core/models/goal_impact.dart';


class GoalColors {
  final List<Color> _blue = [Color(0xFF97D6F1), Color(0xFFDAF1FB)];
  final List<Color> _orange = [Color(0xFFF8D6A2), Color(0xFFFCF4BC)];
  final List<Color> _green = [Color(0xFF8BEBE4), Color(0xFFD0FFEC)];
  final List<Color> _purple = [Color(0xFFE1D0F9), Color(0xFFF7D5F6)];
  final List<Color> _blueGreen = [Color(0xFF9DE2F1), Color(0xFFD7FCF4)];
  final List<Color> _orangeGreen = [Color(0xFFFDEEE4), Color(0xFFD9FCF4)];


  List<Color> get blue => _blue;
  List<Color> get orange => _orange;
  List<Color> get green => _green;
  List<Color> get purple => _purple;
  List<Color> get blueGreen => _blueGreen;
  List<Color> get orangeGreen => _orangeGreen;


  List<Color> getColorByImpact(List<GoalImpact> impact) {
    if (impact.length == 0) {
      return _orange;
    }

    bool hasCarbon = false;
    bool hasWater = false;
    bool hasPlastic = false;

    impact.forEach((GoalImpact i) {
      switch (i.material) {
        case 'water':
          hasWater = true;
          break;
        case 'carbon':
          hasCarbon = true;
          break;
        case 'plastic':
          hasPlastic = true;
          break;
        default:
          break;
      }
    });

    if (hasWater && hasPlastic && hasCarbon) {
      return _orangeGreen;
    } else if (hasWater && hasCarbon) {
      return _blueGreen;
    } else if (hasWater) {
      return _blue;
    } else if (hasCarbon) {
      return _green;
    } else if (hasPlastic) {
      return _purple;
    } else {
      return _orange;
    }
  }
}
