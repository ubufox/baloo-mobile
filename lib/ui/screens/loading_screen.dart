import 'package:flutter/material.dart';

import 'package:baloo/ui/components/Animated/loading_widget.dart';


class LoadingScreen extends StatelessWidget {
  String message;


  LoadingScreen({ this.message });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFDFFFF),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoadingWidget(message: message),
            ],
          )
        ),
      ),
    );
  }
}
