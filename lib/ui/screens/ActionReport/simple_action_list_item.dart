import 'package:flutter/material.dart';

import 'package:baloo/core/models/impact_action.dart';


class SimpleActionListItem extends StatefulWidget {
  final ImpactAction action;
  final Function add;
  final Function remove;

  SimpleActionListItem(
    @required this.action,
    {
      @required this.add,
      @required this.remove,
    }
  );

  @override
  _SimpleListItemState createState() => _SimpleListItemState();
}

class _SimpleListItemState extends State<SimpleActionListItem> {
  bool active;

  @override
  void initState() {
    active = false;

    super.initState();
  }

  void handleTap() {
    active = !active;

    if (!active) {
      widget.remove(widget.action);
    } else {
      widget.add(widget.action);
    }
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = active
      ? BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.2, 1.0],
            colors: [Color(0xFFC8F6F3), Color(0xFFC9EEFC)],
          ),
          boxShadow: [
            new BoxShadow(
              color: Color(0x0F000000),
              offset: const Offset(0.0, 3.0),
              blurRadius: 8.0,
            ),
          ],
          borderRadius: BorderRadius.circular(8.0),
        )
      : BoxDecoration(
          color: Color(0xFFFFFFFF),
          boxShadow: [
            new BoxShadow(
              color: Color(0x0F000000),
              offset: const Offset(0.0, 3.0),
              blurRadius: 8.0,
            ),
          ],
          borderRadius: BorderRadius.circular(8.0),
        );

    return GestureDetector(
      onTap: handleTap,
      child: Container(
        decoration: decoration,
        margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
        child: Padding(
          padding: new EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
          child: Text(
            widget.action.message,
            style: TextStyle(
              fontFamily: 'Muli',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFF2F2F33),
            ),
          ),
        ),
      ),
    );
  }
}
