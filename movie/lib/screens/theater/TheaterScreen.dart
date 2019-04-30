import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';

class TheaterScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 30, 42, 58),
      child: ListView(),
    );
  }
}
