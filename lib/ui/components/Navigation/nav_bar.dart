import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';


class NavBar extends StatelessWidget{
  final _items = [{
    'icon': Icons.home,
    'tooltip': 'Home',
    'location': RoutePaths.Home,
  }, {
    'icon': Icons.beach_access,
    'tooltip': 'Community',
    'location': RoutePaths.Communities,
  }, {
    'icon': Icons.spa,
    'tooltip': 'Goal',
    'location': RoutePaths.Goal,
  }, {
    'icon': Icons.perm_identity,
    'tooltip': 'Profile',
    'location': RoutePaths.Profile,
  }];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _navItem(
            icon: _items[0]['icon'],
            tooltip: _items[0]['tooltip'],
            location: _items[0]['location'],
          ),
          _navItem(
            icon: _items[1]['icon'],
            tooltip: _items[1]['tooltip'],
            location: _items[1]['location'],
          ),
          _navItem(
            icon: _items[2]['icon'],
            tooltip: _items[2]['tooltip'],
            location: _items[2]['location'],
          ),
          _navItem(
            icon: _items[3]['icon'],
            tooltip: _items[3]['tooltip'],
            location: _items[3]['location'],
          ),
        ],
      ),
    );
  }
}

class _navItem extends StatelessWidget{
  _navItem({
    @required this.icon,
    @required this.tooltip,
    @required this.location,
  });

  final icon;
  final String tooltip;
  final String location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        icon,
        color: Colors.grey,
        size: 24.0,
      ),
      onTap: () {
        Navigator.pushNamed(context, location);
      },
    );
  }
}
