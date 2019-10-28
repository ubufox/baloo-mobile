import 'package:flutter/material.dart';


class FilterRowItem extends StatelessWidget{
  final String title;
  bool isActive;

  FilterRowItem({
    @required this.title,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    if (isActive == null) {
      isActive = false;
    }

    return Container(
      height: 18.0,
      margin: const EdgeInsets.only(right: 28.0),
      child: Text(
        title.toUpperCase(),
        style: isActive
          ? TextStyle(
              color: Color(0xFF2F2F33),
              fontFamily: 'Muli',
              fontWeight: FontWeight.w700,
              fontSize: 14,
            )
          : TextStyle(
              color: Color(0xFF595959),
              fontFamily: 'Muli',
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
      ),
    );
  }
}
