import 'package:flutter/material.dart';

import 'package:baloo/ui/components/Inputs/filter_row_item.dart';


class CommunitySearchBar extends StatefulWidget {
  @override
  _CommunitySearchState createState() => _CommunitySearchState();
}

class _CommunitySearchState extends State<CommunitySearchBar> {
  String filter;
  String search;
  bool searchActive;

  @override void initState() {
    filter = 'Nearby';
    searchActive = false;

    super.initState();
  }

  @override
  Widget build(BuildContext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container (
          height: 40,
          margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 4.0),
          child: Text(
            'Discover',
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
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 32.0),
      width: 280,
      child: Row(
        children: <Widget>[
          FilterRowItem(title: 'NEARBY', isActive: true),
          FilterRowItem(title: 'POPULAR'),
          FilterRowItem(title: 'NEWEST'),
        ],
      ),
    );
  }
}
