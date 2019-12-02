import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/screens/Communities/Search/community_listitem.dart';

// Models
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/viewmodels/componentmodels/community_search_model.dart';


class CommunitySearchResults extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<CommunitySearchModel>(
      builder: (_, csm, child ) =>
        csm.loading
          ? SliverToBoxAdapter(child: Container(child: Text('loading communities')))
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) =>
                  CommunityListItem(community: csm.results[index]),
                childCount: csm.count,
              ),
            ),
    );
  }
}

