import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/router.dart';
import 'package:baloo/core/constants/routes.dart';


// void main() => runApp(MainApp());

void main() {
  runApp(
    MultiProvider(
      providers: [],
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
