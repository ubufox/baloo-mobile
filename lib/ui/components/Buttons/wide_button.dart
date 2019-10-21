import 'package:flutter/material.dart';


class WideButton extends StatelessWidget {
  WideButton({ @required this.label });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Color(0x0F000000),
            offset: new Offset(0.0, 3.0),
            blurRadius: 8.0,
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: Text(
            '$label'.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Muli',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xFF0083BB),
            ),
          ),
        ),
      ),
    );
  }
}
