import 'package:flutter/foundation.dart';


class NavBarModel extends ChangeNotifier {
  String _activeRoute;

  NavBarModel();

  String get active => _activeRoute;

  void updateRoute(String newRoute) {
    if (newRoute != _activeRoute) {
      _activeRoute = newRoute;
      notifyListeners();
    }
  }
}
