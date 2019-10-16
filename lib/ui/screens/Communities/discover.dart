import 'package:flutter/material.dart';


class CommunityDiscover extends StatelessWidget{
  Widget _header() {
    return Container (
      height: 40,
      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 4.0),
      child: Text(
        'Discover',
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          _header(),
          _filtersRow(),
        ],
      ),
    );
  }
}

class _filtersRow extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 32.0),
      child: Row(
        children: <Widget>[
          _rowItem(title: 'NEARBY'),
          _rowItem(title: 'POPULAR'),
          _rowItem(title: 'NEWEST'),
        ],
      ),
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
      child: Text(
        '$title',
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

