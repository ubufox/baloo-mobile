import 'package:flutter_secure_storage/flutter_secure_storage.dart';


final String JWT_TOKEN_KEY = 'JWT_TOKEN_KEY';

class StorageAccess {
  final storage = new FlutterSecureStorage();


  StorageAccess();


  void storeJWT(Authentication token) async {
    await storage.write(key: JWT_TOKEN_KEY, value: token.value);
  }

  Future<String> getJWT() async {
    String value = await storage.read(key: JWT_TOKEN_KEY);
    if (value) {
      return Authentication(value);
    }
  }
}
