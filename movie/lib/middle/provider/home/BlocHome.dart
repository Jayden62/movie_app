import 'dart:async';

import 'package:movie/middle/provider/base/BlocProvider.dart';

class BlocHome extends BlocBase {
  StreamController<int> homeController = StreamController();

  StreamSink get homeSink => homeController.sink;

  Stream<int> get homeStream => homeController.stream;



  @override
  void dispose() {
    homeController.close();
  }

  @override
  void init() {

  }
}
