import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/screens/Communities/community_listitem.dart';
import 'package:baloo/ui/components/base_data_widget.dart';

// Models
import 'package:baloo/core/viewmodels/community_search_model.dart';


class CommunitySearchResults extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BaseDataWidget<CommunitySearchModel>(
      model: CommunitySearchModel(api: Provider.of(context)),
      onModelReady: (model) => { /* TODO mjf: fetch data */ },
      builder: (context, communities, child) {
        print('build communities length = ' + communities.communities.length.toString());

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CommunityListItem(community: communities.communities[index]);
            },
            childCount: communities.length,
          ),
        );
      }
    );
  }
}

