import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/components/base_data_widget.dart';
import 'package:baloo/ui/screens/Communities/Search/community_search_results.dart';
import 'package:baloo/ui/screens/Communities/Search/community_search_bar.dart';

// Models
import 'package:baloo/core/viewmodels/componentmodels/community_search_model.dart';
import 'package:baloo/core/viewmodels/global/user_view_model.dart';
import 'package:baloo/core/models/community.dart';


// Child of custom scroll view
class CommunitySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel uvm = Provider.of<UserViewModel>(context);

    return BaseDataWidget<CommunitySearchModel>(
      model: CommunitySearchModel(
        cvm: Provider.of(context),
        user: uvm.user,
      ),
      builder: (context, csm, child) =>
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            <Widget>[
              CommunitySearchBar(
                updateQuery: csm.updateQuery,
                updateFilter: csm.updateFilter,
              ),
              csm.loading
                ? Container(
                    child: Text('...loading communities'),
                  )
                : CommunitySearchResults(
                     communities: csm.results,
                     count: csm.count,
                   ),
            ],
          ),
        ),
    );
  }
}
