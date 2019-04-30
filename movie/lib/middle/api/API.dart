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

  Future<List<Movie>> getMovies() async {
    try {
      List<Movie> movies = [];

      movies.add(Movie('HELL BOY', 'C16', '2giờ 2phút ',
          'http://lestoilesheroiques.fr/wp-content/uploads/2019/03/D2HmK8zUcAAJPiq.jpg'));
      movies.add(Movie('END GAME', 'C18', '3giờ 2phút ',
          'https://znews-photo.zadn.vn/w660/Uploaded/xbhunku/2019_03_15/D1nkY7UVAAUs7KN.jpg'));
      movies.add(Movie('LẬT MẶT 4', 'C11', '1giờ 40phút ',
          'https://i-ione.vnecdn.net/2019/03/12/image010-1552375474-1552375487-2146-1552375543_1200x0.png'));
      movies.add(Movie('QUÝ CÔ LỪA ĐẢO', 'C22', '1giờ 58phút',
          'https://reviewphimaz.com/wp-content/uploads/2018/05/15-bo-phim-hai-khong-the-bo-qua-nam-2018-12.jpg'));

      return movies;
    } catch (e) {}
    return null;
  }
}
