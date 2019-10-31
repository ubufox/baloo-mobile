import 'package:flutter/material.dart';


class FilterRowItem extends StatelessWidget{
  final String title;
  final Function onPressed;
  bool isActive = false;

  FilterRowItem(
    @required this.title, {
    @required this.onPressed,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }
}
