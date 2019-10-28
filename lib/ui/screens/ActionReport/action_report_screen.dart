import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/components/Navigation/nav_action_button.dart';
import 'package:baloo/ui/components/Navigation/back_navigation_bar.dart';
import 'package:baloo/ui/components/Buttons/wide_button.dart';
import 'package:baloo/ui/screens/ActionReport/action_search_bar.dart';

// Models
import 'package:baloo/core/models/impact_action.dart';
import 'package:baloo/core/viewmodels/nav_bar_model.dart';


class ActionReport extends StatefulWidget {
  ActionReport();

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<ActionReport> {
  List<ImpactAction> activeActions = [];

  @override
  Widget build(BuildContext) {
    final nav = Provider.of<NavBarModel>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/profile_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 72.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(child: ActionSearchBar()),
                  SliverToBoxAdapter(
                    child: WideButton(
                      label: 'Log ${activeActions.length} actions',
                      onFill: () {
                        /* push active actions into pending actions */
                        nav.updateRoute(RoutePaths.Impact);
                        Navigator.pushNamed(context, RoutePaths.Impact);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          BackNavigationBar(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Hero(
          tag: 'navBar',
          child: NavBar(),
        ),
      ),
    );
  }
}
