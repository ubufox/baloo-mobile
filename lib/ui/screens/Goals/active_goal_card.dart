import 'package:flutter/material.dart';

// Models
import 'package:baloo/core/models/user_goal.dart';



class ActiveGoalCard extends StatelessWidget {
  final UserGoal goal;


  ActiveGoalCard({ @required this.goal });


  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20.0, 28.0, 20.0, 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Active Goal',
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
                goal.text,
                style: TextStyle(
                  color: Color(0xFF2F2F33),
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 32.0),
              child: Text(
                goal.nextFocus.text,
                style: TextStyle(
                  color: Color(0xFF595959),
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 128,
                  width: 128,
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        color: const Color(0x1F000000),
                        offset: const Offset(0.0, 1.0),
                      ),
                      const BoxShadow(
                        color: const Color(0xFFFFFFFF),
                        spreadRadius: 0.0,
                        blurRadius: 7.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(94.0),
                  ),
                ),
                Container(
                  height: 104,
                  width: 104,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    boxShadow: [
                      const BoxShadow(
                        color: const Color(0x1F000000),
                        offset: const Offset(0.0, 5.0),
                        blurRadius: 14.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(89.0),
                  ),
                  child: Center(
                    child: Text(
                      goal.progress.toString() + '%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF2F2F33),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 116.0,
                  width: 116.0,
                  child: CircularProgressIndicator(
                    value: goal.progress / 100,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1DC8F1)),
                    strokeWidth: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
