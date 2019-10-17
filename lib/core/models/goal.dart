import 'package:flutter/material.dart';


class Goal {
  final String title;
  final String description;
  final String focus; // this will be dynamic and change weekly
  final int progress;
  final List<Color> colors;

  Goal(
    this.title,
    this.description,
    this.focus,
    this.progress,
    this.colors,
  );

  String getTitle() {
    return '$title';
  }

  String getDescription() {
    return '$description';
  }

  String getFocus() {
    return '$focus';
  }

  int getProgress() {
    return progress;
  }

  List<Color> getColors() {
    return colors;
  }
}
