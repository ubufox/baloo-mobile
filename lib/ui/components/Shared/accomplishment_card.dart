import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';


class AccomplishmentCard extends StatelessWidget {
  AccomplishmentCard({
    @required this.title,
    @required this.startDate,
    @required this.completeDate,
    @required this.actionCount,
    @required this.primaryLabel,
    @required this.primarySavings,
    @required this.colors,
  });

  final String title;
  final DateTime startDate;
  final DateTime completeDate;
  final int actionCount;
  final String primaryLabel;
  final String primarySavings;
  final colors;


  Widget _topSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              '$title',
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
              'Completed on',
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

  Widget _bottomSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              '$primaryLabel',
              style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF2F2F33),
              ),
            ),
          ),
          Text(
            '$primarySavings',
            style: TextStyle(
              fontFamily: 'Muli',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF595959),
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
          Navigator.pushNamed(context, RoutePaths.Accomplishment);
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
              colors: colors,
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
              _bottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
