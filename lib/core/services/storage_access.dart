import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Models
import 'package:baloo/core/models/authentication.dart';


final String JWT_TOKEN_KEY = 'JWT_TOKEN_KEY';

class StorageAccess {
  final storage = new FlutterSecureStorage();


  StorageAccess();


  void storeJWT(String token) async {
    await storage.write(key: JWT_TOKEN_KEY, value: token);
  }

  Future<String> getJWT() async {
    return await storage.read(key: JWT_TOKEN_KEY);
  }
}
