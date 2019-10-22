import 'package:flutter/material.dart';
import 'dart:math';


class ImpactCard extends StatelessWidget {
  ImpactCard({
    @required this.header,
    this.subheader,
    @required this.value,
    this.isFocus,
    @required this.startColor,
    @required this.endColor,
  });

  final String header;
  final String subheader;
  final String value;
  final bool isFocus;
  final Color startColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.fromLTRB(0.0, 20.0, 12.0, 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.0, 1.0],
          colors: [
            startColor,
            endColor,
          ],
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          new BoxShadow(
            color: Color(0x28000000),
            offset: new Offset(0.0, 4.0),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
            _headerSection(
              header: '$header',
              subheader: '$subheader',
              isFocus: isFocus,
            ),
            _valueText(
              value: '$value',
            ),
          ],
      ),
    );
  }
}


class _headerSection extends StatelessWidget {
  _headerSection({
    @required this.header,
    @required this.subheader,
    @required this.isFocus,
  });

  final String header;
  final String subheader;
  final bool isFocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isFocus ? <Widget>[
            _subheaderText(subheader: '$subheader'),
            _headerText(header: '$header'),
          ] : <Widget>[
            _headerText(header: '$header'),
            _subheaderText(subheader: '$subheader'),
          ],
      ),
    );
  }
}


class _headerText extends StatelessWidget {
  _headerText({
    @required this.header,
  });

  final String header;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        '$header',
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
    );
  }
}

class _subheaderText extends StatelessWidget {
  _subheaderText({
    @required this.subheader,
  });

  final String subheader;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        '$subheader',
        style: TextStyle(
          color: Color(0xFF595959),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _valueText extends StatelessWidget {
  _valueText({
    @required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Text(
        '$value',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }
}
