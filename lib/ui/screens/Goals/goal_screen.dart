import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/components/Navigation/nav_action_button.dart';
import 'package:baloo/ui/screens/Goals/goal_card.dart';
import 'package:baloo/ui/screens/Goals/active_goal_card.dart';
import 'package:baloo/ui/components/base_data_widget.dart';

// Models
import 'package:baloo/core/models/goal.dart';
import 'package:baloo/core/models/new_goal.dart';
import 'package:baloo/core/models/user_goal.dart';
import 'package:baloo/core/viewmodels/screenmodels/goals_model.dart';
import 'package:baloo/core/viewmodels/global/goals_view_model.dart';
import 'package:baloo/core/viewmodels/global/engagement_view_model.dart';


class GoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseDataWidget<GoalsModel>(
        model: GoalsModel(
          gvm: Provider.of<GoalsViewModel>(context),
          evm: Provider.of<EngagementViewModel>(context),
        ),
        builder: (context, model, child) =>
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/goals_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: model.loading == true
              ? Container(
                  margin: const EdgeInsets.fromLTRB(20.0, 24.0, 0.0, 12.0),
                  child: Text('...loading your goals'),
              )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 24.0),
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
                    SliverToBoxAdapter(child: ActiveGoalCard(goal: model.activeGoal)),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 12.0),
                        child: const Text(
                          'Personal',
                          style: TextStyle(
                            color: Color(0xFF2F2F33),
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: _personalGoalsList(
                      goals: model.personal,
                    )),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                'Community',
                                style: TextStyle(
                                  color: Color(0xFF2F2F33),
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            Text(
                              "Goals from communities you're a part of",
                              style: TextStyle(
                                color: Color(0xFF979797),
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: _communitiesGoalsList(
                      goals: model.community,
                    )),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Hero(
          tag: 'navBar',
          child: NavBar(),
        ),
      ),
      floatingActionButton: NavActionButton(),
    );
  }
}

class _personalGoalsList extends StatelessWidget {
  final List<NewGoal> goals;


  _personalGoalsList({ @required this.goals });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304,
      margin: const EdgeInsets.only(left: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: goals.length,
        itemBuilder: (BuildContext context, int index) {
          return GoalCard(goal: goals[index]);
        },
      ),
    );
  }
}

class _communitiesGoalsList extends StatelessWidget {
  final List<NewGoal> goals;


  _communitiesGoalsList({ @required this.goals });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304,
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 60.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: goals.length,
        itemBuilder: (BuildContext context, int index) {
          return GoalCard(goal: goals[index]);
        },
      ),
    );
  }
}
