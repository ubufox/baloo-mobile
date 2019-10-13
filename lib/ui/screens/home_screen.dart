import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          color: Colors.white,
          child: Center(
              child: Text(
                'Impact',
                textDirection: TextDirection.ltr,
              ),
            ),
        ),
        FlatButton(
          child: Container(
            height: 40,
            color: Colors.blue[300],
            child: Center(
              child: Text(
                'Communities',
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RoutePaths.Communities);
          }
        ),
      ],
    );
  }
}
