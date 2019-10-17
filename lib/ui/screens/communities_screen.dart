import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/screens/Communities/community_card.dart';
import 'package:baloo/ui/screens/Communities/community_listitem.dart';
import 'package:baloo/ui/screens/Communities/discover.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';

// Models
import 'package:baloo/core/models/community.dart';


class CommunitiesScreen extends StatelessWidget{
  Widget _yourCommunitiesListView(BuildContext context) {
    final communities = [{
        'name': 'Heal the Bay',
        'members': '14.2K members',
        'location': 'Los Angeles, CA',
        'bannerImage': 'assets/images/default_community.jpg',
        'about': 'About text',
      }, {
        'name': 'The Sierra Club',
        'members': '67.8K members',
        'location': 'Oakland, CA',
        'bannerImage': 'assets/images/sierraclub.jpg',
        'about': "The Sierra Club is the most enduring and influential grassroots environmental organization in the United States. We amplify the power of our 3.5+ million members and supporters to defend everyone’s right to a healthy world.",
      }, {
        'name': 'Surfrider Foundation',
        'members': '683 members',
        'location': 'Santa Monica, CA',
        'bannerImage': 'assets/images/default_community.jpg',
        'about': 'About text',
      }, {
        'name': "Grand View Farmer's Market",
        'members': '888 members',
        'location': 'Los Angeles, CA',
        'bannerImage': 'assets/images/default_community.jpg',
        'about': 'About text',
      },
    ];

    return SliverToBoxAdapter(
      child: Container(
        height: 224,
        margin: const EdgeInsets.fromLTRB(20.0, 16.0, 0.0, 20.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: communities.length,
          itemBuilder: (BuildContext context, int index) {
            return CommunityCard(
              community: Community(
                communities[index]['name'],
                communities[index]['members'],
                communities[index]['location'],
                communities[index]['bannerImage'],
                communities[index]['about'],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _header() {
    return Container (
      height: 28,
      margin: const EdgeInsets.fromLTRB(20.0, 96.0, 20.0, 4.0),
      child: Text(
        'Your Communities',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli', fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
    );
  }

  // move to public method in discover widget
  Widget _discoverCommunitiesListView(BuildContext context) {
    final searchResults = [{
      'imageURL': 'assets/images/sierraclub.jpg',
      'name': 'The Sierra Club',
      'location': 'Oakland, CA',
      'members': '188K',
      'about': "The Sierra Club is the most enduring and influential grassroots environmental organization in the United States. We amplify the power of our 3.5+ million members and supporters to defend everyone’s right to a healthy world.",
    }, {
      'imageURL': 'assets/images/npca.jpg',
      'name': 'National Parks Conservation Association',
      'location': 'Washington, DC',
      'members': '268K',
      'about': 'About text',
    }, {
      'imageURL': 'assets/images/treepeople.jpg',
      'name': 'TreePeople',
      'location': 'Beverly Hills, CA',
      'members': '5.8K',
      'about': 'About text',
    }];

    return SliverList(
      delegate: new SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final Community comm =  new Community(
              searchResults[index]['name'],
              searchResults[index]['members'],
              searchResults[index]['location'],
              searchResults[index]['imageURL'],
              searchResults[index]['about'],
            );

          return CommunityListItem(
            community: comm,
          );
        },
        childCount: searchResults.length,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(child: _header()),
          _yourCommunitiesListView(context),
          CommunityDiscover(),
          _discoverCommunitiesListView(context),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: NavBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.Action);
        },
        tooltip: 'Go Home',
        child: Icon(Icons.flash_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
