import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/provider_setup.dart';
import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/router.dart';


void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MainApp(),
    ),
  );
}


class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baloo',
      initialRoute: RoutePaths.Action,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
