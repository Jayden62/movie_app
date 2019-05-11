import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';

class BlocHome extends BlocBase {
  StreamController<int> homeController = StreamController();

  StreamSink get homeSink => homeController.sink;

  Stream<int> get homeStream => homeController.stream;

  StreamController<List<Color>> bottomController = StreamController();

  StreamSink get bottomSink => bottomController.sink;

  Stream<List<Color>> get bottomStream => bottomController.stream;

  @override
  void dispose() {
    homeController.close();
    bottomController.close();
  }

  @override
  void init() {

  }
}
