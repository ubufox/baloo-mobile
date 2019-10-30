import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/components/base_data_widget.dart';
import 'package:baloo/ui/screens/ActionReport/simple_action_list_item.dart';
import 'package:baloo/core/viewmodels/actions_list_model.dart';


class ActionsList extends StatelessWidget {
  final Function add;
  final Function remove;

  ActionsList({
    @required this.add,
    @required this.remove,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDataWidget<ActionsListModel>(
      model: ActionsListModel(api: Provider.of(context)),
      onModelReady: (model) => { /* TODO mjf: fetch data */ },
      builder: (context, actions, child) =>
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) =>
              SimpleActionListItem(
                actions.actionSearchResults[index],
                add: add,
                remove: remove,
              ),
            childCount: actions.actionSearchResults.length,
          ),
        ),
    );
  }
}
