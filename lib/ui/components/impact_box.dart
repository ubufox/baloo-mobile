import 'package:flutter/material.dart';


class ImpactBox extends StatelessWidget{
  ImpactBox({
    @required this.id,
    @required this.name,
    @required this.members,
    @required this.location,
  });

  final int id;
  final String name;
  final int members;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          print('$name');
        },
        child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text(
                '$name',
                textDirection: TextDirection.ltr,
              ),
              Text(
                '$members',
                textDirection: TextDirection.ltr,
              ),
              Text(
                '$location',
                textDirection: TextDirection.ltr,
              ),
            ]
          ),
        ),
      ),
    );
  }
}

