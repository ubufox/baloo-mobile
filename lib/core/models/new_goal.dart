// Focus is defined in this package as well
import 'package:flutter/material.dart' hide Focus;

import 'package:baloo/core/models/focus.dart';
import 'package:baloo/core/models/goal_impact.dart';
import 'package:baloo/core/models/goal_colors.dart';


// TODO mjf
//   remove all references to previous goal and update this to Goal
class NewGoal {
  final String _id;
  final String _imperativeMessage;
  final String _description;
  final String _zipcode;
  final String _type;
  final DateTime _createdAt;
  List<Focus> _focuses;
  List<GoalImpact> _impacts;
  int _progress;
  final List<Color> _colors;


  NewGoal({
    String id,
    String imperativeMessage,
    String description,
    String zipcode,
    String type,
    DateTime createdAt,
    List<Focus> focuses,
    List<GoalImpact> impacts,
    List<Color> colors,
  }) :
    _id = id,
    _imperativeMessage = imperativeMessage,
    _description = description,
    _zipcode = zipcode,
    _type = type,
    _createdAt = createdAt,
    _focuses = focuses,
    _impacts = impacts,
    _progress = 0,
    _colors = colors;


  String get id => _id;
  String get imperativeMessage => _imperativeMessage;
  String get description => _description;
  String get zipcode => _zipcode;
  String get type => _type;
  DateTime get createdAt => _createdAt;
  List<Focus> get focuses => _focuses;
  List<GoalImpact> get impact => _impacts;
  int get progress => _progress;
  List<Color> get colors => _colors;


  // JSON STRUCTURE MATCHES GRAPHQL IN GOAL QUERY FILE
  static NewGoal fromJSON(Map<String, dynamic> json) {
    List<Focus> builtFocuses = json['goal_focuses']
      .map<Focus>((f) => Focus.fromJSON(f['focusByfocusId']))
      .toList();
    List<GoalImpact> builtImpacts = json['goal_impacts']
      .map<GoalImpact>((g) => GoalImpact.fromJSON(g))
      .toList();
    List<Color> goalColors = new GoalColors().getColorByImpact(builtImpacts);


    return NewGoal(
      id: json['id'].toString(),
      imperativeMessage: json['imperativeMessage'],
      description: json['description'],
      zipcode: json['zipcode'],
      type: json['type'],
      createdAt: DateTime.parse(json['createdAt']),
      focuses: builtFocuses,
      impacts: builtImpacts,
      colors: goalColors,
    );
  }
}
