import 'package:flutter/material.dart';

import 'package:baloo/ui/components/Inputs/filter_row_item.dart';


class ActionSearchBar extends StatefulWidget {
  @override
  _ActionSearchState createState() => _ActionSearchState();
}

class _ActionSearchState extends State<ActionSearchBar> {
  String filter;
  String search;
  bool searchActive;

  @override void initState() {
    filter = 'Frequent';
    searchActive = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container (
          margin: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 4.0),
          child: Text(
            'Log Actions',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xFF2F2F33),
              fontFamily: 'Muli',
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
          ),
        ),
        _filters(),
      ],
    );
  }
}

class _filters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final options = [{
      'title': 'Frequent',
      'isActive': true,
    }, {
      'title': 'Popular',
      'isActive': false,
    }, {
      'title': 'Newest',
      'isActive': false,
    }, {
      'title': 'Water',
      'isActive': false,
    }, {
      'title': 'CO2',
      'isActive': false,
    }, {
      'title': 'Engagement',
      'isActive': false,
    }];

    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 32.0),
      height: 28,
      width: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) =>
          FilterRowItem(
            title: options[index]['title'],
            isActive: options[index]['isActive'],
          ),
      ),
    );
  }
}
