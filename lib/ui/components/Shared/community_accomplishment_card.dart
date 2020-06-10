import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:baloo/core/constants/routes.dart';

import 'package:baloo/core/models/community_goal.dart';


class CommunityAccomplishmentCard extends StatelessWidget {
  final CommunityGoal accomplishment;

  CommunityAccomplishmentCard(@required this.accomplishment);

  Widget _topSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              accomplishment.goal.imperativeMessage,
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
              'Completed on ${accomplishment.completedAt.toString()}',
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

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutePaths.Accomplishment,
            arguments: accomplishment,
          );
        },
        child: Container(
          height: 260,
          width: 232,
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 12.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.0, 1.0],
              colors: accomplishment.goal.colors,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _topSection(),
            ],
          ),
        ),
      ),
    );
  }
}
