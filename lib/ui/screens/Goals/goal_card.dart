import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';
// Models
import 'package:baloo/core/models/goal.dart';


class GoalCard extends StatelessWidget {
  GoalCard({ @required this.goal });

  final Goal goal;

  Widget _topSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              goal.getTitle(),
              style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF2F2F33),
              ),
            ),
          ),
          Container(
            child: Text(
              goal.getFocus(),
              style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF595959),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _progressSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Progress',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF2F2F33),
                  ),
                ),
                Text(
                  goal.getProgress().toString() + '%',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF2F2F33),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              LinearProgressIndicator(
                value: (goal.getProgress() / 100),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1BF1F9)),
                backgroundColor: Color(0x99FFFFFF),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutePaths.GoalDetail,
          );
        },
        child: Container(
          height: 280,
          width: 260,
          margin: const EdgeInsets.only(right: 20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.0, 1.0],
              colors: goal.getColors(),
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
              _topSection(),
              _progressSection(),
            ],
          ),
        ),
      ),
    );
  }
}
