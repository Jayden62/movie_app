import 'package:flutter/material.dart';
import 'package:movie/base/dialog/loading/BaseLoadingDialog.dart';
import 'package:movie/base/dialog/message/BaseMessageDialog.dart';
import 'package:movie/utils/SlideRoute.dart';

abstract class BaseHeader extends StatelessWidget {
  final BaseLoadingDialog loadingDialog = BaseLoadingDialog();
  final BaseMessageDialog messageDialog = BaseMessageDialog();

  @override
  Widget build(BuildContext context) {
    return onInitHeader(context);
  }

  /// With item is not used Scaffold
  Widget onInitHeader(BuildContext context);

  /// Start screen
  dynamic pushScreen(BuildContext context, Widget widget) async {
    return await Navigator.push(context, SlideRoute(widget: widget));
  }

  /// Start with replacement screen
  dynamic pushReplaceScreen(BuildContext context, Widget widget) async {
    return await Navigator.pushReplacement(context, SlideRoute(widget: widget));
  }

  /// Back screen.
  void popScreen(BuildContext context, {dynamic data}) {
    if (data == null) {
      Navigator.pop(context);
    } else {
      Navigator.pop(context, data);
    }
  }

  /// Show loading dialog
  /// Param (context)
  void showLoadingDialog(BuildContext context) {
    loadingDialog.showLoading(context);
  }

  /// Hide loading dialog
  /// Param (context)
  void hideLoadingDialog(BuildContext context) {
    loadingDialog.hideLoading(context);
  }

  /// Check status loading dialog.
  bool isShowLoadingDialog() {
    return loadingDialog.isLoading;
  }

  /// Show message dialog
  /// Param (context, message, {title, okLabel, cancelLabel, okTap, cancelTap})
  void showMessageDialog(BuildContext context, String message,
      {String title,
      String okLabel,
      String cancelLabel,
      Function onTapOK,
      Function onTapCancel}) {
    messageDialog.showMessageDialog(context, message,
        title: title, okLabel: okLabel, okTap: onTapOK);
  }
}
