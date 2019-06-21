import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart' as mButton;

class BoxScreen extends StatelessWidget {
  final BuildContext context;

  BoxScreen(this.context);

  Widget onInitBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: GridView.count(
          crossAxisCount: 6,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(18, (index) {
            return Center(
              child: _boxItem('$index'),
            );
          })),
    );
  }

  Widget _boxItem(String box) {
    return Container(
        child: mButton.Button(
      box,
      width: 30,
      height: 30,
      defaultStyle: TextStyle(color: Colors.white),
      defaultDecoration: BoxDecoration(
        border: Border.all(color: yellowColor),
      ),
      highlightDecoration: BoxDecoration(
        border: Border.all(color: grayColor),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return onInitBox();
  }
}
