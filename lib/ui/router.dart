import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/screens/home_screen.dart';
import 'package:baloo/ui/screens/Action/action_screen.dart';
import 'package:baloo/ui/screens/communities_screen.dart';
import 'package:baloo/ui/screens/does_not_exist_screen.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Action:
        return MaterialPageRoute(builder: (_) => ActionScreen());
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutePaths.Communities:
        return MaterialPageRoute(builder: (_) => CommunitiesScreen());
      default:
        return MaterialPageRoute(builder: (_) => DoesNotExistScreen());
    }
  }
}

