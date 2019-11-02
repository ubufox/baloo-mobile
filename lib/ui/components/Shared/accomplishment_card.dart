import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:baloo/core/constants/routes.dart';

// Models
import 'package:baloo/core/models/accomplishment.dart';


class AccomplishmentCard extends StatelessWidget {
  final Accomplishment accomplishment;

  AccomplishmentCard(@required this.accomplishment);

  Widget _topSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              accomplishment.title,
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
    String primaryLabel;
    String primarySavings;
    NumberFormat f = NumberFormat('###,###,###.##', 'en_US');

    switch (accomplishment.type) {
      case 'water':
        primaryLabel = 'Total Water Savings';
        primarySavings = f.format(accomplishment.water);
        break;
      case 'co2':
        primaryLabel = 'Total CO2 Savings';
        primarySavings = f.format(accomplishment.co2);
        break;
      case 'plastic':
        primaryLabel = 'Total Plastic Savings';
        primarySavings = f.format(accomplishment.plastic);
        break;
      default:
        primaryLabel = 'Total Actions Taken';
        primarySavings = f.format(accomplishment.actionCount);
        break;
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              primaryLabel,
              style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF2F2F33),
              ),
            ),
          ),
          Text(
            primarySavings,
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
              colors: accomplishment.colors,
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
