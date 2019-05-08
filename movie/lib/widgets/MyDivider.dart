import 'package:flutter/material.dart';
import 'package:movie/base/style/BaseStyle.dart';

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      child: Divider(
        height: 1,
        color: Colors.grey,
      ),
    );
  }
}
