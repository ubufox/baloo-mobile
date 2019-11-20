import 'package:flutter/material.dart';

import 'package:baloo/ui/screens/Communities/community_listitem.dart';

// Models
import 'package:baloo/core/models/community.dart';


class CommunitySearchResults extends StatelessWidget{
  final List<Community> communities;
  final int count;

  CommunitySearchResults({
    @required this.communities,
    @required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return count == 0
      ? SliverToBoxAdapter(
          child: Container(
            child: Text('No communities')
          ),
        )
      : SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CommunityListItem(community: communities[index]);
            },
            childCount: count,
          ),
        );
  }
}

