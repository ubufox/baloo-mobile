import 'package:flutter/material.dart';
import 'dart:math';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/screens/Impact/impact_card.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';


class ImpactScreen extends StatefulWidget {
  @override
  _ImpactScreenState createState() => _ImpactScreenState();
}


class _ImpactScreenState extends State<ImpactScreen> {
  String activeRange = 'P'; // P = personal G = global

  int previousActiveCard = 0;
  int activeCard = 0;
  double componentWidth = 252.0; // impact card width after margins

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        activeCard = (_scrollController.offset/componentWidth).round();
        if (activeCard != previousActiveCard) {
          _scrollController.animateTo(
            activeCard * componentWidth,
            duration: Duration(milliseconds: 250),
            curve: Curves.ease,
          );
          previousActiveCard = activeCard;
        }
        setState(() {});
      });
  }


  Widget _header() {
    return Container (
      height: 40,
      margin: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 4.0),
      child: Text(
        'Impact',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ),
      ),
    );
  }

  Widget _rangeRow() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 0.0),
      child: Row(
        children: <Widget>[
          _rowItem(title: 'PERSONAL'),
          _rowItem(title: 'GLOBAL'),
        ]
      ),
    );
  }

  Widget _yourImpactListView(BuildContext context) {
    final impactCards = [{
        'header': 'Eat two plant-based meals',
        'subheader': "This week's focus",
        'value': '1/2',
        'isFocus': true,
        'startColor': Color(0xFFFDEEE4),
        'endColor': Color(0xFFD9FCF4),
      }, {
        'header': 'Water Saved',
        'subheader': "You've completed 236 water saving actions",
        'value': '46,458.5 l',
        'isFocus': false,
        'startColor': Color(0xFF9DE2F1),
        'endColor': Color(0xFFD7FCF4),
      }, {
        'header': 'CO2 Saved',
        'subheader': "You've completed 132 CO2 saving actions",
        'value': '158.8 kg',
        'isFocus': false,
        'startColor': Color(0xFFA6EDB9),
        'endColor': Color(0xFFF2FABF),
      }, {
        'header': 'Actions Completed',
        'subheader': '',
        'value': '253',
        'isFocus': false,
        'startColor': Color(0xFFFEDBCA),
        'endColor': Color(0xFFFAF2C1),
      }, {
        'value': 'spacer',
      }
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      itemCount: impactCards.length,
      itemBuilder: (context, index) {
        // scale based on the distance from active position
        double position = componentWidth * index;
        double distance = (position - _scrollController.offset).abs();
        double scale = max(1.0 - (distance / componentWidth), 0.75);

        if (impactCards[index]['value'] == 'spacer') {
          return Container(width: 120);
        }

        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Transform.scale(
              scale: scale,
              child: ImpactCard(
                header: impactCards[index]['header'],
                subheader: impactCards[index]['subheader'],
                value: impactCards[index]['value'],
                isFocus: impactCards[index]['isFocus'],
                startColor: impactCards[index]['startColor'],
                endColor: impactCards[index]['endColor'],
              ),
            ),
          );
        }
        return Transform.scale(
          scale: scale,
          child: ImpactCard(
            header: impactCards[index]['header'],
            subheader: impactCards[index]['subheader'],
            value: impactCards[index]['value'],
            isFocus: impactCards[index]['isFocus'],
            startColor: impactCards[index]['startColor'],
            endColor: impactCards[index]['endColor'],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/impact_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(),
            _rangeRow(),
            Container(
              height: 320,
              margin: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
              child: _yourImpactListView(context),
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
      child: Text(
        '$title',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }
}
