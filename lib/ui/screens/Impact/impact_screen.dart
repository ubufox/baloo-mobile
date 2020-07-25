import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/screens/Impact/impact_card.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/components/Navigation/nav_action_button.dart';
import 'package:baloo/ui/components/base_data_widget.dart';

// Models
import 'package:baloo/core/viewmodels/impact_model.dart';
import 'package:baloo/core/viewmodels/global/engagement_view_model.dart';
import 'package:baloo/core/models/impact_action.dart';
import 'package:baloo/core/models/action_data.dart';
import 'package:baloo/core/models/user_focus.dart';
import 'package:baloo/core/models/statistics.dart';

// Extensions
import 'package:baloo/core/extensions/capitalize.dart';


class ImpactScreen extends StatefulWidget {
  @override
  _ImpactScreenState createState() => _ImpactScreenState();
}


class _ImpactScreenState extends State<ImpactScreen> {
  ScrollController _scrollController;

  int previousActiveCard = 0;
  int activeCard = 0;
  double componentWidth = 210.0; // impact card width after margins

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        activeCard = (_scrollController.offset/componentWidth).round();
        if (activeCard != previousActiveCard) {
          _scrollController.animateTo(
            activeCard * componentWidth,
            duration: Duration(milliseconds: 250),
            curve: Curves.ease,
          );
          previousActiveCard = activeCard;
        }
        setState(() {});
      });
  }


  Widget _header() {
    return Container (
      height: 40,
      margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 4.0),
      child: Text(
        'Impact',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ),
      ),
    );
  }

  Widget _rangeRow() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 0.0),
      child: Row(
        children: <Widget>[
          _rowItem(title: 'PERSONAL'),
          _rowItem(title: 'GLOBAL'),
        ]
      ),
    );
  }

  Widget _yourImpactListView(BuildContext context, Statistics statistics, UserFocus focus, bool isLoading) {
    if (isLoading || statistics == null) {
      return Text(
        'Loading statistics',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      );
    }

    List<Widget> impactCards = focus != null
      ? [
        new ImpactCard(
          header: "Current Focus",
          subheader: focus.completedAt == null ? focus.text : '${focus.text} (Complete)',
          value: (focus.actions.length - 1).toDouble(),
          isFocus: false,
          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
        ),
      ] : [];

    statistics.stats.forEach((k, v) {
      impactCards.insert(
        impactCards.length,
        new ImpactCard(
          header:  "${k.capitalize()} Saved",
          subheader: "You've completed ${v.actions} ${k} saving actions",
          value: v.amount,
          unit: v.unit,
          isFocus: false,
          colors: v.colors,
        ),
      );
    });
    impactCards.insert(impactCards.length, new ImpactCard(
      header:  'Actions Completed',
      subheader: '',
      value: statistics.actionCount.toDouble(),
      isFocus: false,
      colors: [
        Color(0xFFFEDBCA),
        Color(0xFFFAF2C1),
      ],
    ));
    impactCards.insert(impactCards.length, Container(width: 160));

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      itemCount: impactCards.length,
      itemBuilder: (context, index) {
        // scale based on the distance from active position
        double position = componentWidth * index;
        double distance = (position - _scrollController.offset).abs();
        double scale = max(1.0 - (distance / componentWidth), 0.8);

        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Transform.scale(
              scale: scale,
              child: impactCards[index],
            ),
          );
        }

        return Transform.scale(
          scale: scale,
          child: impactCards[index],
        );
      },
    );
  }

  void recurringPull(ImpactModel model) {
    if (model.pendingActions.length > 0) {
      List pulledValue = model.pullImpactAction();

      if (pulledValue[0] == true) {
        ImpactAction action = pulledValue[1];

        // update action count with new action
        // model.userImpact.addAction();

        // // get material action data
        // List<ActionData> material_impact = action.impact;

        // // add all material amounts to the user impact
        // material_impact.forEach((e) {
        //   if (e.material == 'water') {
        //     model.userImpact.addWater(e.amount);
        //   } else if (e.material == 'co2') {
        //     model.userImpact.addCO2(e.amount);
        //   }
        // });
      }

      Timer(Duration(milliseconds: 2000), () => recurringPull(model));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseDataWidget<ImpactModel>(
      model: ImpactModel(
        api: Provider.of(context),
        evm: Provider.of<EngagementViewModel>(context),
      ),
      onModelReady: (model) {
        Timer(Duration(milliseconds: 500), () => recurringPull(model));
      },
      builder: (context, impact, child) =>
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/impact_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _header(),
                _rangeRow(),
                Container(
                  height: 280,
                  margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: _yourImpactListView(context, impact.statistics, impact.currentFocus, impact.loading),
                ),
              ]
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Hero(
              tag: 'navBar',
              child: NavBar(),
            ),
          ),
          floatingActionButton: NavActionButton(),
        ),
    );
  }
}

class _rowItem extends StatelessWidget{
  _rowItem({ @required this.title });

  final String title;

  @override
  Widget build(BuildContext content) {
    return Container(
      height: 18.0,
      margin: const EdgeInsets.only(right: 28.0),
      child: Text(
        '$title',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }
}
