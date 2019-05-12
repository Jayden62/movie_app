import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/middle/api/API.dart';
import 'package:movie/middle/model/Movie.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';

class BlocMovie extends BlocBase {
  StreamController<bool> loadDataController;

  StreamController<Movie> infoController;

  StreamController<List<Movie>> photoController;

  ValueChanged<Movie> movieCallback;

  @override
  void dispose() {
    loadDataController.close();
    photoController.close();
    infoController.close();
    loadDataController = null;
    infoController = null;
    photoController = null;
  }

  @override
  void init() {
    print('-----Init Stream-----');
    loadDataController = StreamController();

    infoController = StreamController();

    photoController = StreamController();

    loadDataController.stream.listen((data) async {
      if (data) {
        final result = await API.instance.getMovies();
        photoController.sink.add(result);
      }
    });
  }
}
