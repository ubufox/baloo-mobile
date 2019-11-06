import 'package:flutter/foundation.dart';


class LoadingModel extends ChangeNotifier {
  bool _isLoading = false;
  String _loadingMessage = 'loading';


  LoadingModel();


  String get loadingMessage => _loadingMessage;
  String get isLoading => _isLoading;


  void showLoading(String msg) {
    _isLoading = true;
    _loadingMessage = msg;
    notifyListeners();
  }

  void doneLoading() {
    _isLoading = false;
    _loadingMessage = 'loading';
    notifyListeners();
  }
}
