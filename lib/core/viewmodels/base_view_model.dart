import 'package:flutter/foundation.dart';


class BaseViewModel extends ChangeNotifier {
  bool _isLoading;


  bool get loading => _isLoading;


  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
