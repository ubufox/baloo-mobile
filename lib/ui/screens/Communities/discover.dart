import 'package:flutter/material.dart';


class CommunityDiscover extends StatelessWidget{
  Widget _header() {
    return Container (
      color: Colors.blue[500],
      height: 40,
      margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 12.0),
      child: Text(
        'Discover',
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w600,
          fontSize: 32,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _header(),
        _filtersRow(),
      ],
    );
  }
}

class _filtersRow extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        _rowItem(title: 'NEARBY'),
        _rowItem(title: 'POPULAR'),
        _rowItem(title: 'NEWEST'),
      ],
    );
  }
}

class _rowItem extends StatelessWidget{
  _rowItem({ @required this.title });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.0,
      margin: const EdgeInsets.only(right: 28.0),
      child: Text('$title'),
    );
  }
}

