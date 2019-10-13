import 'package:flutter/material.dart';

import 'package:baloo/ui/router.dart';
import 'package:baloo/core/constants/routes.dart';


void main() => runApp(MainApp());


class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baloo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePaths.Home,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
