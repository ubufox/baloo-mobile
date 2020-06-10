import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/components/Navigation/back_navigation_bar.dart';
import 'package:baloo/ui/components/Buttons/wide_button.dart';
import 'package:baloo/ui/components/Shared/community_accomplishment_card.dart';
import 'package:baloo/ui/screens/Goals/goal_card.dart';
import 'package:baloo/ui/components/base_data_widget.dart';
import 'package:baloo/ui/components/Animated/loading_widget.dart';

// Models
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/community_goal.dart';
import 'package:baloo/core/models/new_goal.dart';
import 'package:baloo/core/viewmodels/community_detail_model.dart';


class CommunityDetail extends StatelessWidget {
  final String communityId;


  CommunityDetail({ @required this.communityId });


  Widget _header(
    String name,
    int members,
    String city,
    String imageURL
  ) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              name,
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
              city,
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
              '$members members',
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
            child: FittedBox(
              child: Image.network(imageURL),
              fit: BoxFit.cover,
            )
          ),
        ],
      ),
    );
  }

  Widget _about(String desc) {
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
            desc,
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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFDFFFF),
            ),
          ),
          BaseDataWidget<CommunityDetailModel>(
            model: CommunityDetailModel(
              cvm: Provider.of(context),
              ucvm: Provider.of(context),
              uvm: Provider.of(context),
              communityId: communityId,
            ),
            onModelReady: (model) => model.getCommunity(),
            builder: (context, model, child) {
              if (model.loading != false) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    LoadingWidget(message: '...loading community')
                  ],
                );
              }

              bool isMember = model.community.isMember;


              return CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: _header(
                      model.community.name,
                      model.community.members,
                      model.community.city + ', ' + model.community.state,
                      model.community.imageURL,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: WideButton(
                      label: isMember ? 'Leave ' + model.community.name : 'Join ' + model.community.name,
                      onFill: model.updateMemberStatus,
                    ),
                  ),
                  model.community.currentGoal != null
                    ? _currentGoal(goal: model.community.currentGoal.goal)
                    : SliverToBoxAdapter(child: Container()),
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
                  SliverToBoxAdapter(child: _communityAccomplishments(accomplishments: model.community.accomplishments)),
                  model.community.description != null
                    ? SliverToBoxAdapter(child: _about(model.community.description))
                    : SliverToBoxAdapter(child: Container()),
                ],
              );
            }
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

class _currentGoal extends StatelessWidget {
  final NewGoal _goal;

  _currentGoal({ NewGoal goal }) : _goal = goal;


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
            child: GoalCard(goal: _goal),
          ),
        ],
      ),
    );
  }
}

class _communityAccomplishments extends StatelessWidget {
  final List<CommunityGoal> _accomplishments;

  _communityAccomplishments({ List<CommunityGoal> accomplishments })
    : _accomplishments = accomplishments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 302,
      margin: const EdgeInsets.only(left: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _accomplishments.length,
        itemBuilder: (BuildContext context, int index) =>
          CommunityAccomplishmentCard(_accomplishments[index]),
      ),
    );
  }
}
