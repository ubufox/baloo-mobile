import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/screens/Home/impact_card.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';


class HomeScreen extends StatelessWidget{
  final impactCards = [{
      'header': 'Eat two plant-based meals',
      'subheader': "This week's focus",
      'value': '1/2',
      'isFocus': true,
    }, {
      'header': 'Actions Completed',
      'value': '253',
      'isFocus': false,
    }, {
      'header': 'Water Saved',
      'subheader': "You've completed 236 water saving actions",
      'value': '46,458.5 l',
      'isFocus': false,
    }, {
      'header': 'CO2 Saved',
      'subheader': "You've completed 132 CO2 saving actions",
      'value': '158.8 kg',
      'isFocus': false,
    },
  ];


  Widget _header() {
    return Container (
      height: 40,
      margin: const EdgeInsets.fromLTRB(20.0, 48.0, 20.0, 4.0),
      child: Text(
        'Impact',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w600,
          fontSize: 32,
        ),
      ),
    );
  }

  Widget _rangeRow() {
    return Row(
      children: <Widget>[
        _rowItem(title: 'PERSONAL'),
        _rowItem(title: 'REGIONAL'),
        _rowItem(title: 'GLOBAL'),
      ]
    );
  }

  Widget _yourImpactListView(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: impactCards.length,
      itemBuilder: (context, index) {
        return ImpactCard(
          header: impactCards[index]['header'],
          subheader: impactCards[index]['subheader'],
          value: impactCards[index]['value'],
          isFocus: impactCards[index]['isFocus'],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(),
            _rangeRow(),
            Container(
              height: 280,
              margin: const EdgeInsets.all(20.0),
              child: _yourImpactListView(context),
            ),
            FlatButton(
              child: Container(
                height: 40,
                color: Colors.blue[300],
                child: Center(
                  child: Text(
                    'Communities',
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, RoutePaths.Communities);
              }
            ),
          ]
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: NavBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.Action);
        },
        tooltip: 'Record Action',
        child: Icon(Icons.flash_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _rowItem extends StatelessWidget{
  _rowItem({ @required this.title });

  final String title;

  @override
  Widget build(BuildContext content) {
    return Container(
      height: 18.0,
      margin: const EdgeInsets.only(right: 28.0),
      child: Text('$title'),
    );
  }
}
