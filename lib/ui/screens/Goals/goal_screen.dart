import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/screens/Goals/goal_card.dart';
import 'package:baloo/ui/screens/Goals/active_goal_card.dart';

// Models
import 'package:baloo/core/models/goal.dart';


class GoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/goals_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
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
            SliverToBoxAdapter(child: ActiveGoalCard()),
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
            SliverToBoxAdapter(child: _personalGoalsList()),
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
            SliverToBoxAdapter(child: _communitiesGoalsList()),
          ],
        ),
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

class _personalGoalsList extends StatelessWidget {
  final List<Goal> personal_goals = [
    new Goal(
      "Save the average person's yearly water usage",
      "Default description text",
      "Take a shower that is shorter than five minutes",
      43,
      [Color(0xFFF8D6A2), Color(0xFFFCF4BC)],
    ),
    new Goal(
      "Reduce your plastic impact by five years",
      "Default description text",
      "Skip the straw",
      27,
      [Color(0xFFE1D0F9), Color(0xFFF7D5F6)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304,
      margin: const EdgeInsets.only(left: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: personal_goals.length,
        itemBuilder: (BuildContext context, int index) {
          return GoalCard(goal: personal_goals[index]);
        },
      ),
    );
  }
}

class _communitiesGoalsList extends StatelessWidget {
  final List<Goal> personal_goals = [
    new Goal(
      'Help Surfrider pick up 20 trash cans worth of plastic',
      'Default description text',
      "Attend a Venice Beach clean up event",
      43,
      [Color(0xFF8BEBE4), Color(0xFFD0FFEC)],
    ),
    new Goal(
      "Increase the attendance of Grand View farmer's market by 10%",
      'Default description text',
      "Invite two friends to this week's market",
      27,
      [Color(0xFF97D6F1), Color(0xFFDAF1FB)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304,
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 60.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: personal_goals.length,
        itemBuilder: (BuildContext context, int index) {
          return GoalCard(goal: personal_goals[index]);
        },
      ),
    );
  }
}
