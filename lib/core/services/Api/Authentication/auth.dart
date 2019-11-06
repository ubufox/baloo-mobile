import 'package:baloo/core/models/user.dart';


class AuthAPI {
  final String AuthUrl = 'AUTH_API_URL';

  AuthAPI();

  //
  //
  // LOGIN
  Future<bool> sendLoginCode(String phone) async {
    /* TODO mjf: hit auth api endpoint */
    bool sent = await Future.delayed(
      Duration(milliseconds: 2500),
      () => true,
    );

    return sent;
  }

  // should return a session token rather than the user Id
  Future<int> confirmLoginCode(String phone, String code) async {
    /* TODO mjf: hit auth api endpoint
       - should return an ID for the confirmed user
    */
    int userId = await Future.delayed(
      Duration(milliseconds: 2000),
      () => 1,
    );
    return userId;
  }

  //
  //
  // ACCOUNT CREATION
  Future<bool> createAccount(String name, String phone, String zipcode) async {
    /* TODO mjf: submit account to Auth API */
    print('submitted new account for ' + name);
    bool created = await Future.delayed(
      Duration(milliseconds: 1000),
      () => true,
    );
    return created;
  }

  Future<int> confirmAccount(String phone, String code) async {
    /* TODO mjf: confirm account with Auth API */
    print('confirm new account with code ' + code);
    int userId = await Future.delayed(
      Duration(milliseconds: 750),
      () => 1,
    );

    return userId;
  }

  //
  //
  // USER
  // TODO mjf: get user by session token
  Future<User> getUserById(int userId) async {
    print('get user with id : ' + userId.toString());
    /* TODO mjf: get user by user auth user id */
    return await Future.delayed(
      Duration(milliseconds: 2500),
      () =>
        new User(
          id: 1,
          name: 'Test User',
          zipcode: '90066',
        ),
    );
  }

  // TODO mjf: should use a session token
  Future<bool> endUserSession(int token) async {
    return await Future.delayed(
      Duration(milliseconds: 100),
      () => true,
    );
  }
}
