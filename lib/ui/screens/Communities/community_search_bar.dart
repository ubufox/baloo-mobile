import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/components/Inputs/Search/search_row.dart';
import 'package:baloo/ui/components/base_data_widget.dart';

// Models
import 'package:baloo/core/viewmodels/community_search_model.dart';


class CommunitySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseDataWidget<CommunitySearchModel>(
      model: CommunitySearchModel(api: Provider.of(context)),
      onModelReady: (model) => { /* TODO mjf: fetch data */ },
      builder: (context, search, child) =>
        Column(
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
            SearchRow(
              search: search.searchCommunities,
              filters: ['Nearby', 'Popular', 'Newest'],
            ),
          ],
        ),
    );
  }
}
