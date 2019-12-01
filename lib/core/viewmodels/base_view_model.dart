import 'package:flutter/foundation.dart';


class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String _error;

  bool get loading => _isLoading;
  String get error => _error;


  void setLoading(bool nloading) {
    // reloads should remove errors
    if (nloading == true) {
      _error = null;
    }

    _isLoading = nloading;
    notifyListeners();
  }

  void setError(String e) {
    _error = e;
  }

  void clearError() {
    _error == null;
  }
}
