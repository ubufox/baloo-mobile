import 'package:http/http.dart';

import 'package:baloo/core/services/storage_access.dart';


class EngageAPI {
  // final String ENGAGE_URL = 'https://us-central1-baloo-hasura.cloudfunctions.net/engage';
  final String ENGAGE_URL = 'http://3d3649236769.ngrok.io';
  final _storage = StorageAccess();
  String _token;


  // GET USER'S TOTAL STATS
  Future<String> getUserStats() async {
    if (_token == null) {
      _token = await _storage.getJWT();
    }

    Map<String, String> headers = {
      "Content-type": "application/application/json",
      "Authorization": _token,
    };

    Response response = await get(
      '${ENGAGE_URL}/userStats',
      headers: headers,
    );

    int statusCode = response.statusCode;

    if (statusCode == 200) {
      return response.body;
    } else {
      throw('Error getting user stats');
    }
  }


  // GET GLOBAL STATS
  Future<String> getGlobalStats() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response response = await get(
      '${ENGAGE_URL}/globalStats',
      headers: headers,
    );

    int statusCode = response.statusCode;

    if (statusCode == 200) {
      return response.body;
    } else {
      throw('Error getting global stats');
    }
  }


  // JOIN GOAL
  Future<void> joinGoal(goalId) async {
    if (_token == null) {
      _token = await _storage.getJWT();
    }

    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded",
      "Authorization": _token,
    };

    Response response = await post(
      '${ENGAGE_URL}/joinGoal',
      headers: headers,
      body: { 'goalId': goalId },
    );

    int statusCode = response.statusCode;

    if (statusCode != 200) {
      throw('Error joining goal');
    }
  }


  // COMPLETE CURRENT ACTION
  Future<void> completeAction(userActionId) async {
    if (_token == null) {
      _token = await _storage.getJWT();
    }

    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded",
      "Authorization": _token,
    };

    Response response = await post(
      '${ENGAGE_URL}/completeFocusAction',
      headers: headers,
      body: { 'userActionId': userActionId},
    );

    int statusCode = response.statusCode;

    if (statusCode != 200) {
      throw('Error completing action');
    }
  }
}
