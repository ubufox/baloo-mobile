import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/components/Navigation/nav_action_button.dart';
import 'package:baloo/ui/components/Buttons/wide_button.dart';
import 'package:baloo/ui/components/Buttons/logout_button.dart';
import 'package:baloo/ui/components/base_data_widget.dart';
import 'package:baloo/ui/components/Shared/accomplishment_card.dart';
import 'package:baloo/ui/components/Inputs/Settings/default_input.dart';
import 'package:baloo/ui/components/Inputs/Settings/allow_sms.dart';
import 'package:baloo/ui/components/Animated/loading_widget.dart';

// Models
import 'package:baloo/core/models/accomplishment.dart';
import 'package:baloo/core/viewmodels/profile_model.dart';


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
        child: BaseDataWidget<ProfileModel>(
          model: ProfileModel(
            gqls: Provider.of(context),
            ds: Provider.of(context),
          ),
          onModelReady: (model) => model.getUser(),
          builder: (context, profile, child) =>
            profile.loading == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LoadingWidget(), // Text('loading user')
                  ],
                )
              : CustomScrollView(
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
                                profile.user.name,
                                style: TextStyle(
                                  color: Color(0xFF2F2F33),
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            Text(
                              profile.user.zipcode,
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
                        label: 'Log actions',
                        onFill: () => Navigator.pushNamed(context, RoutePaths.ActionReport),
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
                            value: profile.user.name,
                          ),
                          DefaultSettingsInput(
                            label: 'ZIP code',
                            value: profile.user.zipcode,
                          ),
                          AllowSMS(),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: new EdgeInsets.only(top: 20.0),
                        child: LogoutButton(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(height: 72),
                    ),
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

class _personalAccomplishments extends StatelessWidget {
  final accomplishments = [
    new Accomplishment(
      'Reduce your plastic waste impact by five years',
      "Your family might use plastic straws, water bottles, and bags for just a few minutes, but those items don’t disappear when they’re thrown out. Single-use items like these account for more than 40 percent of plastic waste, and each year about 8.8 million tons of plastic trash flows into the ocean. This waste endangers wildlife, pollutes the water, and puts human health at risk.",
      new DateTime.utc(2018, 4, 27),
      new DateTime.utc(2018, 9, 5),
      0.0,
      73.7,
      630.8,
      241,
      'plastic',
      [Color(0xFFE1D0F9), Color(0xFFF7D5EB)],
    ),
    new Accomplishment(
      "Save the average person's yearly water usage",
      'Accomplishment description text',
      new DateTime.utc(2018, 5, 11),
      new DateTime.utc(2018, 10, 9),
      14123.75,
      64.0,
      0.0,
      149,
      'water',
      [Color(0xFFF8D6B2), Color(0xFFFCF4BC)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 302,
      margin: const EdgeInsets.only(left: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: accomplishments.length,
        itemBuilder: (BuildContext context, int index) =>
          AccomplishmentCard(accomplishments[index]),
      ),
    );
  }
}
