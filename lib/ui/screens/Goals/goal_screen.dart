import 'package:flutter/material.dart';

import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/core/constants/routes.dart';


class GoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20.0, 96.0, 20.0, 24.0),
              child: const Text(
                'Goals',
                style: TextStyle(
                  color: Color(0xFF2F2F33),
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
            ),
          ),
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
