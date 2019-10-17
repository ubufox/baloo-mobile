import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/screens/home_screen.dart';
import 'package:baloo/ui/screens/Action/action_screen.dart';
import 'package:baloo/ui/screens/communities_screen.dart';
import 'package:baloo/ui/screens/Goals/goal_screen.dart';
import 'package:baloo/ui/screens/Profile/profile_screen.dart';
import 'package:baloo/ui/screens/Communities/community_detail.dart';
import 'package:baloo/ui/screens/does_not_exist_screen.dart';

import 'package:baloo/core/models/community.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Action:
        return MaterialPageRoute(builder: (_) => ActionScreen());
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutePaths.Communities:
        return MaterialPageRoute(
          builder: (_) => CommunitiesScreen(),
        );
      case RoutePaths.Goal:
        return MaterialPageRoute(
          builder: (_) => GoalScreen(),
        );
      case RoutePaths.Profile:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      case RoutePaths.CommunityDetail:
        final Community comm = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => CommunityDetail(community: comm),
        );
      default:
        return MaterialPageRoute(builder: (_) => DoesNotExistScreen());
    }
  }
}

