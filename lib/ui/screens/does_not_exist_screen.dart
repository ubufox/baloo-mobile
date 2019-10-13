import 'package:flutter/material.dart';


class DoesNotExistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This route does not exist',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
