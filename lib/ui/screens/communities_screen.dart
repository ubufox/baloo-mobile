import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/impact_box.dart';
import 'package:baloo/ui/screens/Communities/discover.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';


class CommunitiesScreen extends StatelessWidget{
  final communities = [{
      'id': 1,
      'name': 'Heal the Bay',
      'members': 1248,
      'location': 'Los Angeles, CA',
    }, {
      'id': 2,
      'name': 'The Sierra Club',
      'members': 12384,
      'location': 'Oakland, CA',
    }, {
      'id': 3,
      'name': 'Surfrider Foundation',
      'members': 683,
      'location': 'Santa Monica, CA',
    }, {
      'id': 4,
      'name': "Grand View Farmer's Market",
      'members': 888,
      'location': 'Los Angeles, CA',
    },
  ];

  Widget _yourCommunitiesListView(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: communities.length,
      itemBuilder: (context, index) {
        return ImpactBox(
          id: communities[index]['id'],
          name: communities[index]['name'],
          members: communities[index]['members'],
          location: communities[index]['location'],
        );
      },
    );
  }

  Widget _header() {
    return Container (
      height: 28,
      margin: const EdgeInsets.fromLTRB(20.0, 48.0, 20.0, 4.0),
      child: Text(
        'Your Communities',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _header(),
          Container(
            margin: const EdgeInsets.all(20.0),
            height: 200,
            child: _yourCommunitiesListView(context),
          ),
          CommunityDiscover(),
        ]
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
