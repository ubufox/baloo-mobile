import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/components/Inputs/Search/search_row.dart';

// Models
import 'package:baloo/core/viewmodels/componentmodels/community_search_model.dart';


class CommunitySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     // CommunitySearchModel csm = Provider.of<CommunitySearchModel>(context);

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
        Consumer<CommunitySearchModel>(
          builder: (_, csm, child) =>
            SearchRow(
              updateQuery: csm.updateQuery,
              updateFilter: csm.updateFilter,
              filters: ['Nearby', 'Popular', 'Newest'],
            ),
        ),
      ],
    );
  }
}
