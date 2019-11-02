import 'package:flutter/material.dart';

import 'package:baloo/ui/components/Inputs/Search/search_row.dart';


class ActionSearchBar extends StatelessWidget {
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
        SearchRow(
          search: (query, filters) => { /* TODO mjf */ },
          filters: [
            'Frequent',
            'Popular',
            'Newest',
            'Water',
            'CO2',
            'Engagement',
          ],
        ),
      ],
    );
  }
}
