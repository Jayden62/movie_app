import 'package:movie/base/dialog/loading/BaseLoadingStyle.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:flutter/material.dart';

class BaseLoadingDialog {
  bool isLoading = false;

  /// Show loading dialog
  /// Param (context)
  void showLoading(BuildContext context) async {
    if (isLoading) {
      return;
    }

    /// Create dialog.
    SimpleDialog loadingDialog = SimpleDialog(
      contentPadding: contentPadding,
      backgroundColor: Color.fromARGB(255, 30, 42, 58),
      shape: roundCorner,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 93, 104, 120))),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//                Container(
//                  margin: loadingMargin,
//                  color: Color.fromARGB(255, 30, 42, 58),
//                  child: Text(
//                    '',
//                    style: loadingStyle,
//                  ),
//                ),
                Container(
                  margin: waitingMargin,
                  color: Color.fromARGB(255, 30, 42, 58),
                  child: Text(
                    ' Loading ... ',
                    style: waitingStyle,
                  ),
                ),
              ],
            ))
          ],
        )
      ],
    );

    isLoading = true;

    /// Show loading dialog
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          /// Prevent back press on Android, we use WillPopScope and override onWillPop.
          return WillPopScope(onWillPop: () {}, child: loadingDialog);
        });
  }

  /// Hide loading
  /// Param (context)
  void hideLoading(BuildContext context) {
    if (!isLoading) {
      return;
    }
    isLoading = false;

    /// Close dialog
    Navigator.pop(context);
  }
}
