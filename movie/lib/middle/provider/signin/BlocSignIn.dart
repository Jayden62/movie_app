import 'dart:async';

import 'package:movie/middle/api/API.dart';
import 'package:movie/middle/model/Data.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:flutter/material.dart';

class BlocSignIn extends BlocBase {
  StreamController<bool> signInEnabledController = StreamController();

  StreamSink get signInEnabledSink => signInEnabledController.sink;

  Stream<bool> get signInEnabledStream => signInEnabledController.stream;

  StreamController<Data<List<String>>> inputSignInController =
      StreamController();

  StreamSink get inputSignInSink => inputSignInController.sink;

  ValueChanged<bool> signInCallback;

  BlocSignIn() {
    inputSignInController.stream.listen((data) async {
      final result =
          await API.instance.callUserLogin(data.data[0], data.data[1]);
      signInCallback(result);
    });
  }

  @override
  void dispose() {
    signInEnabledController.close();
    inputSignInController.close();
  }
}
