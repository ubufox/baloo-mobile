import 'package:flutter/foundation.dart';


class NavBarModel extends ChangeNotifier {
  String _activeRoute;
  bool _completed = false;

  NavBarModel();

  String get active => _activeRoute;
  bool get completed => _completed;

  void updateRoute(String newRoute) {
    if (newRoute != _activeRoute) {
      _activeRoute = newRoute;
      notifyListeners();
    }
  }

  void setCompleted() {
    _completed = true;
    notifyListeners();
  }
}
