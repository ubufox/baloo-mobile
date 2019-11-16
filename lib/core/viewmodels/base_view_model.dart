import 'package:flutter/foundation.dart';


class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;


  bool get loading => _isLoading;


  void setLoading(bool nloading) {
    // TODO mjf: force loading to be at least 1500 millis

    _isLoading = nloading;
    notifyListeners();
  }
}
