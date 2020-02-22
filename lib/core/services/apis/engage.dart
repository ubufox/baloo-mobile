import 'package:http/http.dart';

// JOIN GOAL
// COMPLETE AN ACTION
// GET GLOBAL TOTAL STATS


class EngageAPI {
  final String ENGAGE_URL = 'https://us-central1-baloo-hasura.cloudfunctions.net/engage';


  // GET USER'S TOTAL STATS
  Future<String> getUserStats(String jwt) async {
    print('authorization token');
    print(jwt);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": jwt.toString(),
    };

    Response response = await get(
      '${ENGAGE_URL}/userStats',
      headers: headers,
    );

    print('response');
    print(response.body);

    int statusCode = response.statusCode;

    if (statusCode == 200) {
      return response.body;
    } else {
      throw('Error getting user stats');
    }
  }
}
