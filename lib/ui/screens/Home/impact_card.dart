import 'package:flutter/material.dart';
import 'dart:math';


class ImpactCard extends StatelessWidget {
  ImpactCard({
    @required this.header,
    this.subheader,
    @required this.value,
    this.isFocus,
  });

  final String header;
  final String subheader;
  final String value;
  final bool isFocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 200,
      color: Colors.blue[(new Random().nextInt(10) * 100)],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isFocus ? <Widget>[
            Text('$subheader'),
            Text('$header'),
            Text('$value'),
          ] : <Widget>[
            Text('$header'),
            Text('$subheader'),
            Text('$value'),
          ],
      ),
    );
  }
}
