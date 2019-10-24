import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';

import 'package:baloo/ui/screens/Action/action_screen.dart';
import 'package:baloo/ui/screens/communities_screen.dart';
// import 'package:baloo/ui/screens/Communities/community_detail.dart';

import 'package:baloo/ui/router.dart';
import 'package:baloo/provider_setup.dart';


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


// class SubApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _SubAppState();
// }
// 
// class _SubAppState extends State<SubApp> {
//   int _currentIndex = 0;
//   final _tabViews = [
//     ActionScreen(),
//     CommunitiesScreen(),
//   ];
// 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _tabViews[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem> [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.flash_on),
//             title: Text('Action'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.beach_access),
//             title: Text('Community'),
//           ),
//         ],
//         currentIndex: _currentIndex,
//         fixedColor: Colors.deepPurple,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// 
//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
