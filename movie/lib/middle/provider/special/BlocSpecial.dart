import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/middle/api/API.dart';
import 'package:movie/middle/model/Movie.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';

class BlocSpecial extends BlocBase {
  StreamController<bool> specialDataController;

  StreamController<Movie> specialInfoController;

  StreamController<List<Movie>> specialPhotoController;

  ValueChanged<Movie> movieCallback;

  @override
  void dispose() {
    specialDataController.close();
    specialPhotoController.close();
    specialInfoController.close();
    specialDataController = null;
    specialInfoController = null;
    specialPhotoController = null;
  }

  @override
  void init() {
    print('-----Init Stream-----');
    specialDataController = StreamController();

    specialInfoController = StreamController();

    specialPhotoController = StreamController();

    specialDataController.stream.listen((data) async {
      if (data) {
        final result = await API.instance.getMovies();
        specialPhotoController.sink.add(result);
      }
    });
  }
}
