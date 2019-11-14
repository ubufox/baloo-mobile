import 'package:baloo/core/models/user.dart';


class UserAPI {
  String _token;


  UserAPI({ Function observe }) {
    // observe("token", onTokenUpdate);
  }


  void onTokenUpdate(String nToken) {
    _token = nToken;
  }


  Future<User> getUser() async {
    return null;
  }
}
