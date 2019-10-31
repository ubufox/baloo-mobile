import 'package:flutter/material.dart';

import 'package:baloo/ui/screens/Communities/community_listitem.dart';

// Models
import 'package:baloo/core/models/community.dart';


class CommunitySearchResults extends StatelessWidget{
  final List<Community> communities;

  CommunitySearchResults({ @required this.communities });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return CommunityListItem(community: communities[index]);
        },
        childCount: communities.length,
      ),
    );
  }
}

