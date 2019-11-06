import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  final String message;


  Loading({ @required this.message });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(message),
      ),
    );
  }
}
