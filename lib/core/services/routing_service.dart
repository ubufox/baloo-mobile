import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';

import 'package:baloo/ui/screens/Impact/impact_screen.dart';
import 'package:baloo/ui/screens/communities_screen.dart';


class RouteState {
  final String routeName;
  final Object data;

  const RouteState(this.routeName, this.data);
}


class RouteNotifier with ChangeNotifier {
  RouteState _currentRoute = RouteState('/', {});

  String get route => _currentRoute.routeName;
  Object get data => _currentRoute.data;

  void updateRoute(context, routeName, [Object newData]) {
    final updatedData = {
      ...data,
      '$routeName' : newData,
    };

    _currentRoute = RouteState(routeName, updatedData);
    Navigator.pushNamed(context, routeName);
    notifyListeners();
  }

  Widget getView() {
    switch (route) {
      case RoutePaths.Communities:
        return CommunitiesScreen();
      default:
        return ImpactScreen();
    }
  }
}
