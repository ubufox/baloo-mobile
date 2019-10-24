import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/base_data_widget.dart';
import 'package:baloo/core/viewmodels/nav_bar_model.dart';


class NavBar extends StatelessWidget{
  final List<_TabData> _tabs = [
    new _TabData(
      route: RoutePaths.Impact,
      baseImageUrl: 'assets/images/Icons/impact',
      tooltip: 'Impact',
    ),
    new _TabData(
      route: RoutePaths.Communities,
      baseImageUrl: 'assets/images/Icons/community',
      tooltip: 'Community',
    ),
    new _TabData(
      route: RoutePaths.Goal,
      baseImageUrl: 'assets/images/Icons/goals',
      tooltip: 'Goals',
    ),
    new _TabData(
      route: RoutePaths.Profile,
      baseImageUrl: 'assets/images/Icons/profile',
      tooltip: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavBarModel>(context);

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Color(0x0F000000),
            offset: const Offset(0.0, -4.0),
            blurRadius: 8.0,
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _tabs.map((t) =>
            _Tab(
              tabData: t,
              isActive: t.checkActive(nav.active),
              onTap: () {
                nav.updateRoute(t.route);
                Navigator.pushNamed(
                  context,
                  t.route,
                );
              },
            ),
          ).toList(),
        ),
      ),
    );
  }
}


class _Tab extends StatelessWidget{
  final _TabData tabData;
  final onTap;
  final bool isActive;

  _Tab({
    @required this.tabData,
    @required this.onTap,
    @required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final String _imageUrl = isActive
      ? tabData.baseImageUrl + '_active.png'
      : tabData.baseImageUrl + '_default.png';

    return GestureDetector(
      child: Container(
        height: 32,
          child: Image(
            image: AssetImage(_imageUrl),
            fit: BoxFit.scaleDown,
          ),
      ),
      onTap: onTap,
    );
  }
}

class _TabData {
  String _route;
  String _baseImageUrl;
  String _tooltip;

  _TabData({
    @required String route,
    @required String baseImageUrl,
    @required String tooltip,
  }) {
    _route = route;
    _baseImageUrl = baseImageUrl;
    _tooltip = tooltip;
  }

  String get baseImageUrl => _baseImageUrl;
  String get tooltip => _tooltip;
  String get route => _route;

  bool checkActive(String checkRoute) {
    return route == checkRoute;
  }
}
