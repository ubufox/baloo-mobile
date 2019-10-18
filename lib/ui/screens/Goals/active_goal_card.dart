import 'package:flutter/material.dart';


class ActiveGoalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 373,
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        boxShadow: [
          new BoxShadow(
            color: Color(0x0F000000),
            offset: new Offset(0.0, 4.0),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20.0, 28.0, 20.0, 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                'Active',
                style: TextStyle(
                  color: Color(0xFFF4AD43),
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                "Save a redwood's annual absorption of CO2 by eating more sustainably",
                style: TextStyle(
                  color: Color(0xFF2F2F33),
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              child: Text(
                "Eat two plant-based meals in one week",
                style: TextStyle(
                  color: Color(0xFF595959),
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
