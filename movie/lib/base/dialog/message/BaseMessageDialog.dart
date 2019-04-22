import 'package:flutter/material.dart';
import 'package:movie/base/dialog/message/BaseMessageStyle.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart';
import 'package:movie/utils/LocalizationsUtil.dart';
import 'package:movie/utils/StringUtil.dart';

class BaseMessageDialog {
  /// Show message dialog
  /// params (context, message, {title, okLabel, callback})
  void showMessageDialog(BuildContext context, String message,
      {String title, String okLabel, Function okTap}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          /// Prevent back press on Android, we use WillPopScope and override onWillPop.
          return WillPopScope(
              onWillPop: () {},
              child: initMessageDialog(context, message,
                  title: title, okLabel: okLabel, okTap: okTap));
        });
  }

  /// Create message dialog
  /// Params (context, message, {title, okLabel, okTap})
  Widget initMessageDialog(BuildContext context, String message,
      {String title, String okLabel, Function okTap}) {
    if (StringUtil.isEmpty(okLabel)) {
      okLabel = LocalizationsUtil.of(context).getOk;
    }

    if (StringUtil.isEmpty(title)) {
      /// Create dialog.
      return SimpleDialog(
        contentPadding: contentPadding,
        shape: roundCorner,
        children: <Widget>[
          /// Message
          Container(
            margin: messageMargin,
            padding: messagePadding,
            child: Text(message, style: messageStyle),
          ),
          Button(
            okLabel,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: largerMargin),
            height: largeButtonHeight,
            defaultStyle: blackStyle,
            highlightStyle: highlightBlackStyle,
            onPress: () {
              Navigator.pop(context);
              if (okTap != null) {
                okTap();
              }
            },
          )
        ],
      );
    }

    /// Create dialog.
    return SimpleDialog(
      contentPadding: contentPadding,
      shape: roundCorner,
      children: <Widget>[
        Container(
          margin: titleMargin,
          child: Text(title, style: titleStyle),
        ),

        /// Message
        Container(
          margin: messageMargin,
          child: Text(message, style: messageStyle),
        ),
        Button(
          okLabel,
          alignment: Alignment.center,
          height: largeButtonHeight,
          defaultStyle: defaultStyleDialog,
          defaultDecoration: defaultDecorationDialog,
          highlightDecoration: highlightDecorationDialog,
          onPress: () {
            Navigator.pop(context);
            if (okTap != null) {
              okTap();
            }
          },
        )
      ],
    );
  }
}
