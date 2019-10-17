import 'package:flutter/material.dart';

import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/core/constants/routes.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(child: Text('Hello Profile')),
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
