import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/core/constants/routes.dart';

// Models
import 'package:baloo/core/viewmodels/nav_bar_model.dart';


class NavActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavBarModel>(context);

    return SizedBox(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        backgroundColor: Color(0xFFA8F4F4),
        child: Center(
          child: Image(
            image: AssetImage('assets/images/Icons/moon.png'),
            fit: BoxFit.contain,
          ),
        ),
        onPressed: () {
          nav.updateRoute(RoutePaths.Action);
          Navigator.pushNamed(
            context,
            RoutePaths.Action,
          );
        },
      ),
    );
  }
}
