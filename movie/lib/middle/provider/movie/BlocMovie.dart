import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/middle/api/API.dart';
import 'package:movie/middle/model/Data.dart';
import 'package:movie/middle/model/Movie.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';

class BlocMovie extends BlocBase {
  StreamController<bool> loadDataController = StreamController();
  StreamController<Movie> infoController = StreamController();
  StreamController<List<Movie>> photoController = StreamController();

  ValueChanged<Movie> movieCallback;

  BlocMovie() {
    loadDataController.stream.listen((data) async {
      if (data) {
        final result = await API.instance.getMovies();
        photoController.sink.add(result);
      }
    });
  }

  @override
  void dispose() {
    loadDataController.close();
    photoController.close();
    infoController.close();
  }
}
