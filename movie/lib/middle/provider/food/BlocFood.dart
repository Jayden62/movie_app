import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';

class BlocFood extends BlocBase {
  int count = 0;
  StreamController foodController = StreamController<int>.broadcast();

  void increment() {
    count += 1;
    foodController.sink.add(count);
  }

  void decrement() {
    count -= 1;
    if (count < 0) {
      count = 0;
    }
    foodController.sink.add(count);
  }

//  ValueChanged<int> callback;
//
//  BlocFood() {
//    foodController.stream.listen((data) {
//      data ++;
//      callback(data);
//    });
//  }

  @override
  void dispose() {
    foodController.close();
  }

  @override
  void init() {}
}
