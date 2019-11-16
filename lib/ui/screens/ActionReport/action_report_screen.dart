import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/components/Navigation/nav_action_button.dart';
import 'package:baloo/ui/components/Navigation/back_navigation_bar.dart';
import 'package:baloo/ui/components/Buttons/wide_button.dart';
import 'package:baloo/ui/components/base_data_widget.dart';
import 'package:baloo/ui/screens/ActionReport/action_search_bar.dart';
import 'package:baloo/ui/screens/ActionReport/actions_list.dart';

// Models
import 'package:baloo/core/models/impact_action.dart';
import 'package:baloo/core/viewmodels/nav_bar_model.dart';
import 'package:baloo/core/viewmodels/impact_model.dart';


class ActionReport extends StatefulWidget {
  ActionReport();

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<ActionReport> {
  List<ImpactAction> activeActions = [];

  void addActiveAction(ImpactAction a) {
    activeActions.insert(activeActions.length, a);
    setState(() => {}); // update the log actions button
  }

  void removeAction(ImpactAction a) {
    activeActions.remove(a);
    setState(() => {}); // update the log actions button
  }

  @override
  Widget build(BuildContext) {
    final nav = Provider.of<NavBarModel>(context);

    return Scaffold(
      body: BaseDataWidget<ImpactModel>(
        model: ImpactModel(
          api: Provider.of(context),
          gql: Provider.of(context),
        ),
        onModelReady: (model) => { /* TODO mjf: fetch data */ },
        builder: (context, impact, child) =>
          Stack(
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
                      ActionsList(
                        add: addActiveAction,
                        remove: removeAction,
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: new EdgeInsets.only(top: 36.0),
                          child: WideButton(
                            label: 'Log ${activeActions.length} actions',
                            onFill: () {
                              impact.completeActions(activeActions);
                              nav.updateRoute(RoutePaths.Impact);
                              Navigator.pushNamed(context, RoutePaths.Impact);
                            },
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(child: Container(height: 100)),
                    ],
                  ),
                ),
              ),
              BackNavigationBar(),
            ],
          ),
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
