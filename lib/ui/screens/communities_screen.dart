import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/screens/Communities/user_communities_list.dart';
import 'package:baloo/ui/screens/Communities/Search/community_search_results.dart';
import 'package:baloo/ui/screens/Communities/Search/community_search_bar.dart';

import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/components/Navigation/nav_action_button.dart';

// Models
import 'package:baloo/core/viewmodels/componentmodels/community_search_model.dart';
import 'package:baloo/core/viewmodels/global/communities_view_model.dart';
import 'package:baloo/core/viewmodels/global/user_view_model.dart';



class CommunitiesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    CommunitiesViewModel cvm = Provider.of<CommunitiesViewModel>(context);
    UserViewModel uvm = Provider.of<UserViewModel>(context);

    return Scaffold(
      body: ChangeNotifierProvider(
        builder: (context) => CommunitySearchModel(
          cvm: cvm,
          user: uvm.user,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/communities_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(child: UserCommunitiesList()),
              SliverToBoxAdapter(child: CommunitySearchBar()),
              CommunitySearchResults(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Hero(
          tag: 'navBar',
          child: NavBar(),
        ),
      ),
      floatingActionButton: NavActionButton(),
    );
  }
}
