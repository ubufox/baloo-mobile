import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Buttons/wide_button.dart';

import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/components/Navigation/nav_action_button.dart';

// Models
import 'package:baloo/core/models/accomplishment.dart';


class AccomplishmentDetail extends StatelessWidget {
  final Accomplishment accomplishment;

  AccomplishmentDetail({ @required this.accomplishment });

  @override
  Widget build(BuildContext context) {
    print('showing AccomplishmentDetail');

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget> [
          SliverToBoxAdapter(child: _accomplishmentBox(accomplishment: accomplishment)),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(bottom: 60.0),
              child: WideButton(
                label: 'Close',
                onFill: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Hero(
          tag: 'navBar',
          child: NavBar(),
        ),
      ),
      floatingActionButton: NavActionButton(),
    );
  }
}


class _accomplishmentBox extends StatelessWidget {
  final Accomplishment accomplishment;

  _accomplishmentBox({ @required this.accomplishment });


  Widget _topSection(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    accomplishment.title,
                    style: TextStyle(
                      color: Color(0xFF2F2F33),
                      fontSize: 22,
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                height: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.close,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              accomplishment.description,
              style: TextStyle(
                color: Color(0xFF595959),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Muli',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statGroup(String label, String value) {
    if (value[0] == '0') {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.only(top: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '$label',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Muli',
                color: Color(0xFF595959),
              ),
            ),
          ),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Muli',
              color: Color(0xFF2F2F33),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomSection() {
    NumberFormat f = NumberFormat('###,###,###.##', 'en_US');
    DateFormat d = DateFormat('M.d.yy');

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _statGroup(
            'Started',
            d.format(accomplishment.started),
          ),
          _statGroup(
            'Completed',
            d.format(accomplishment.completed),
          ),
          _statGroup(
            'Actions',
            f.format(accomplishment.actionCount),
          ),
          _statGroup(
            'Total Water Savings',
            f.format(accomplishment.water) + ' L',
          ),
          _statGroup(
            'Total CO2 Savings',
            f.format(accomplishment.co2) + ' kg',
          ),
          _statGroup(
            'Total Plastic Savings',
            f.format(accomplishment.plastic) + ' kg',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 40.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.0, 1.0],
          colors: accomplishment.colors,
        ),
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
        margin: const EdgeInsets.fromLTRB(20.0, 48.0, 20.0, 36.0),
        child: Column(
          children: <Widget>[
            _topSection(context),
            _bottomSection(),
          ],
        ),
      ),
    );
  }
}
