import 'dart:async';

class API {
  /// Create single ton
  static final API singleton = new API._internal();

  API._internal();

  static API get instance => singleton;

  /// Call API to login
  Future<bool> callUserLogin(String userName, String password) async {
    try {
      String user = 'admin';
      String pwd = '123456';
      if (userName == user && password == pwd) {
        return true;
      }
    } catch (e) {
      return null;
    }
    return false;
  }
}
