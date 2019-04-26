import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/middle/model/Movie.dart';
import 'package:movie/middle/model/Result.dart';

class API {
  /// Create single ton
  static final API singleton = new API._internal();

  API._internal();

  static API get instance => singleton;

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

  Future<List<Movie>> getMovies(Movie movie) async {
    try {
      List<Movie> movies = [];

      movies.add(Movie('HELL BOY', 'C16', '2giờ 2phút '));
      movies.add(Movie('END GAME', 'C18', '3giờ 2phút '));
      movies.add(Movie('LẬT MẶT 4', 'C11', '1giờ 40phút '));
      movies.add(Movie('QUÝ CÔ LỪA ĐẢO', 'C22', '1giờ 58phút'));

      return movies;
    } catch (e) {}
    return null;
  }
}
