import 'package:flutter/material.dart';

import 'package:baloo/ui/screens/Communities/user_communities_list.dart';
import 'package:baloo/ui/screens/Communities/community_search_results.dart';
import 'package:baloo/ui/screens/Communities/community_search_bar.dart';

import 'package:baloo/ui/components/Navigation/nav_bar.dart';


class CommunitiesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      bottomNavigationBar: BottomAppBar(
        child: Hero(
          tag: 'navBar',
          child: NavBar(),
        ),
      ),
    );
  }
}
