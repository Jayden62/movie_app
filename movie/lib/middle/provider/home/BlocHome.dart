import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';

class BlocHome extends BlocBase {
  StreamController<double> homePageController;

  /// Init home page controller.
  void initHomePageController() {
    homePageController = StreamController();
  }

  @override
  void dispose() {
    if (homePageController != null) {
      homePageController.close();
    }
  }
}
