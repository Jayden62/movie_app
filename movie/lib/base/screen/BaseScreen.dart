import 'package:flutter/material.dart';
import 'package:movie/base/dialog/loading/BaseLoadingDialog.dart';
import 'package:movie/base/dialog/message/BaseMessageDialog.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/utils/SlideRoute.dart';

abstract class BaseScreen extends StatelessWidget {
  final BaseLoadingDialog loadingDialog = BaseLoadingDialog();
  final BaseMessageDialog messageDialog = BaseMessageDialog();

  @override
  Widget build(BuildContext context) {
    Widget gestureDetector = GestureDetector(
        onTap: () {
          /// Call this method here to hide soft keyboard when touching outside keyboard.
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            decoration: onInitBackground(context),
            child: Scaffold(
              key: onInitKey(context),
              appBar: onInitAppBar(context),
              body: onInitBody(context),
              bottomNavigationBar: onInitBottomNavigationBar(context),
              floatingActionButton: onInitFloatingActionButton(context),
              drawer: onInitDrawer(context),
              endDrawer: onInitEndDrawer(context),
              bottomSheet: onInitBottomSheet(context),
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomPadding:
                  onInitResizeToAvoidBottomPadding(context),
              primary: onInitPrimary(context),
            )));
    Widget widget;
    if (initTabBar(context)) {
      widget = DefaultTabController(
          key: onInitScaffoldState(context),
          length: 3,
          initialIndex: 0,
          child: gestureDetector);
    } else {
      widget = gestureDetector;
    }
    return MaterialApp(home: widget);
  }

  /// Default background is white
  BoxDecoration onInitBackground(BuildContext context) {
    return BoxDecoration(color: Colors.white);
  }

  Key onInitKey(BuildContext context) {
    return null;
  }

  GlobalKey<ScaffoldState> onInitScaffoldState(BuildContext context) {
    return null;
  }

  PreferredSize onInitAppBar(BuildContext context) {
    /// Default appbar is transparent.
    return PreferredSize(
        preferredSize: Size.fromHeight(zeroSize),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: zeroSize,
        ));
  }

  Widget onInitFloatingActionButton(BuildContext context) {
    return null;
  }

  bool initTabBar(BuildContext context) {
    return false;
  }

  Widget onInitBody(BuildContext context);

  Widget onInitDrawer(BuildContext context) {
    return null;
  }

  Widget onInitEndDrawer(BuildContext context) {
    return null;
  }

  Widget onInitBottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget onInitBottomSheet(BuildContext context) {
    return null;
  }

  bool onInitResizeToAvoidBottomPadding(BuildContext context) {
    return true;
  }

  bool onInitPrimary(BuildContext context) {
    return true;
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
      Function tapOk,
      Function tapCancel}) {
    messageDialog.showMessageDialog(context, message,
        title: title, okLabel: okLabel, okTap: tapOk);
  }

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
}
