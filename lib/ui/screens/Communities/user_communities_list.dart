import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// UI components
import 'package:baloo/ui/components/base_data_widget.dart';
import 'package:baloo/ui/screens/Communities/community_card.dart';

// Models
import 'package:baloo/core/viewmodels/user_communities_model.dart';


class UserCommunitiesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 28,
          margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 4.0),
          child: Text(
            'Your Communities',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Color(0xFF2F2F33),
              fontFamily: 'Muli', fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
        BaseDataWidget<UserCommunitiesModel>(
          model: UserCommunitiesModel(api: Provider.of(context)),
          onModelReady: (model) => { /* TODO mjf: fetch communities */ },
          builder: (context, communities, child) =>
            Container(
              height: 224,
              margin: const EdgeInsets.fromLTRB(20.0, 16.0, 0.0, 20.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: communities.length,
                itemBuilder: (BuildContext context, int index) =>
                  CommunityCard(community: communities.communities[index])
              ),
            ),
        ),
      ],
    );
  }
}
