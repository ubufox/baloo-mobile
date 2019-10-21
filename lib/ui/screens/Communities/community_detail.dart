import 'package:flutter/material.dart';

import 'package:baloo/ui/components/Navigation/nested_top_bar.dart';
import 'package:baloo/ui/components/Buttons/wide_button.dart';
import 'package:baloo/ui/components/Shared/accomplishment_card.dart';
import 'package:baloo/ui/screens/Goals/goal_card.dart';

// Models
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/goal.dart';


class CommunityDetail extends StatelessWidget {
  CommunityDetail({ @required this.community });

  final Community community;

  Widget _header() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              community.getName(),
              style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Color(0xFF2F2F33),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              community.getLocation(),
              style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xFF595959),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              community.getMembers(),
              style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xFF979797),
              ),
            ),
          ),
          Container(
            height: 161,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(community.getBanner()),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _about() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 44.0, 20.0, 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              'About',
              style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Color(0xFF2F2F33),
              ),
            ),
          ),
          Text(
            community.getAbout(),
            style: TextStyle(
              fontFamily: 'Muli',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFF595959),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back', textAlign: TextAlign.left),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(child: _header()),
          SliverToBoxAdapter(
            child: WideButton(
              label: "Join " + community.getName()
            ),
          ),
          _currentGoal(),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 24.0),
              child: const Text(
                'Accomplishments',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xFF2F2F33),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: _communityAccomplishments()),
          SliverToBoxAdapter(child: _about()),
        ],
      ),
    );
  }
}

class _currentGoal extends StatelessWidget {
  final Goal goal = new Goal(
    'Help Surfrider pick up 20 trash cans worth of plastic',
    'There are numerous threas to clean water and healthy beaches, including polluted runoff, offshore oil drilling, habitat loss, development, climate change, plastic in the ocean, and trash on the shore.',
    'Attend a Venice Beach clean up event',
    24,
    [Color(0xFF8BEBE4), Color(0xFFD0FFEC)],
  );

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
            child: const Text(
              'Current Goal',
              style: const TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Color(0xFF2F2F33),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: GoalCard(goal: goal),
          ),
        ],
      ),
    );
  }
}

class _communityAccomplishments extends StatelessWidget {
  final accomplishments = [{
    'title': 'Reduce your plastic impact by five years',
    'startDate': new DateTime.utc(2019, 7, 17),
    'completeDate': new DateTime.utc(2019, 10, 5),
    'actionCount': 149,
    'primaryLabel': 'Total Plastic Savings',
    'primarySavings': '680.8 kg',
    'colors': [Color(0xFFE1D0F9), Color(0xFFF7D5EB)],
  }, {
    'title': "Save the average person's yearly water usage",
    'startDate': new DateTime.utc(2019, 7, 17),
    'completeDate': new DateTime.utc(2019, 10, 5),
    'actionCount': 149,
    'primaryLabel': 'Total Water Savings',
    'primarySavings': '3731.5 gal',
    'colors': [Color(0xFFF8D6A2), Color(0xFFFCF4BC)],
  }];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 302,
      margin: const EdgeInsets.only(left: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: accomplishments.length,
        itemBuilder: (BuildContext context, int index) {
          return AccomplishmentCard(
            title: accomplishments[index]['title'],
            startDate: accomplishments[index]['startDate'],
            completeDate: accomplishments[index]['completeDate'],
            actionCount: accomplishments[index]['actionCount'],
            primaryLabel: accomplishments[index]['primaryLabel'],
            primarySavings: accomplishments[index]['primarySavings'],
            colors: accomplishments[index]['colors'],
          );
        },
      ),
    );
  }
}
