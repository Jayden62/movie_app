import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/middle/api/API.dart';
import 'package:movie/middle/model/Data.dart';
import 'package:movie/middle/model/Movie.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';

class BlocMovie extends BlocBase {

  StreamController<Movie> movieController = StreamController();

  StreamSink get movieSink => movieController.sink;

  ValueChanged<List<Movie>> movieCallback;

  BlocMovie() {
    movieController.stream.listen((data) async {
      final result = await API.instance.getMovies(data);
      movieCallback(result);
    });
  }

  @override
  void dispose() {
    movieController.close();
  }
}
