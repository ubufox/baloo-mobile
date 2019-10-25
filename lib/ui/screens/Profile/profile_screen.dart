import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/components/Navigation/nav_action_button.dart';
import 'package:baloo/ui/components/Buttons/wide_button.dart';
import 'package:baloo/ui/components/Shared/accomplishment_card.dart';
import 'package:baloo/ui/components/Inputs/Settings/default_input.dart';
import 'package:baloo/ui/components/Inputs/Settings/allow_sms.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/profile_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget> [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        'Michael Fox',
                        style: TextStyle(
                          color: Color(0xFF2F2F33),
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Text(
                      '90066',
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
            SliverToBoxAdapter(
              child: WideButton(
                label: 'Log actions'
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 24.0),
                child: Text(
                  'Accomplishments',
                  style: TextStyle(
                    color: Color(0xFF2F2F33),
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: _personalAccomplishments()),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 24.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: Color(0xFF2F2F33),
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  DefaultSettingsInput(
                    label: 'Name',
                    value: 'Michael Fox',
                  ),
                  DefaultSettingsInput(
                    label: 'ZIP code',
                    value: '90066',
                  ),
                  AllowSMS(),
                ],
              ),
            ),
          ],
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

class _personalAccomplishments extends StatelessWidget {
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
