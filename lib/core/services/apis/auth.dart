import 'package:http/http.dart';

import 'package:baloo/core/models/user.dart';
import 'package:baloo/core/models/authentication.dart';


class AuthAPI {
  final String AUTH_URL = 'https://us-central1-baloo-hasura.cloudfunctions.net/auth';

  //
  //
  // LOGIN
  Future<bool> sendLoginCode(String phone) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"phone": "${phone}"}';

    Response response = await post('${AUTH_URL}/begin', headers: headers, body: json);

    int statusCode = response.statusCode;

    if (statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // should return a session token rather than the user Id
  Future<String> confirmLoginCode(String phone, String code) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"phone": "${phone}", "code": "${code}"}';

    Response response = await post('${AUTH_URL}/login', headers: headers, body: json);

    int statusCode = response.statusCode;

    if (statusCode == 200) {
      return response.body;
    }
  }

  //
  //
  // ACCOUNT CREATION
  Future<bool> beginAccountCreation(String phone) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"phone": "${phone}"}';

    Response response = await post(
      '${AUTH_URL}/beginAccount',
      headers: headers,
      body: json,
    );

    int statusCode = response.statusCode;

    if (statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> confirmAccount(String phone, String code, String name, String zipcode) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"phone": "${phone}", "code": "${code}", "name": "${name}", "zipcode": "${zipcode}"}';

    Response response = await post(
      '${AUTH_URL}/createAccount',
      headers: headers,
      body: json,
    );

    int statusCode = response.statusCode;

    if (statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
