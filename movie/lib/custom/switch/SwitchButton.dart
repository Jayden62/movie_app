import 'package:flutter/material.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart';

class SwitchButton extends StatefulWidget {
  /// Title left.
  final String titleLeft;

  /// Title right
  final String titleRight;

  /// Width
  final double width;

  /// Height
  final double height;

  /// Callback when left item press
  final Function() onLeftPress;

  /// Callback when right item press
  final Function() onRightPress;

  /// Callback when right item press
  final EdgeInsets margin;

  /// Constructor
  SwitchButton(this.titleLeft, this.titleRight,
      {this.margin, this.width, this.height, this.onLeftPress, this.onRightPress});

  @override
  State<StatefulWidget> createState() {
    return SwitchButtonState();
  }
}

class SwitchButtonState extends State<SwitchButton> {
  /// Default height
  static const double HEIGHT = 48.0;

  /// Margin
  static const double MARGIN = 4.0;

  bool isLeftItem = true;

  @override
  Widget build(BuildContext context) {
    double height = HEIGHT;

    if (widget.height != null) {
      height = widget.height;
    }

    double heightItem = height - 8;

    /// Margin
    EdgeInsets switchMargin = EdgeInsets.all(0);
    if(widget.margin != null){
      switchMargin = widget.margin;
    }

    /// In the case width is set.
    if (widget.width != null) {
      return initSwitchButton(switchMargin, height, heightItem);
    }

    return initFullSwitchButton(switchMargin, height, heightItem);

  }

  /// Init full switch button
  Widget initFullSwitchButton(EdgeInsets switchMargin, double height, double heightItem){

    /// In the case width is not set
    return Container(
        decoration: defaultSwitchDecoration,
        margin: switchMargin,
        height: height,
        child: Row(
          children: <Widget>[
            /// Left button
            Expanded(
                child: Button(
                  widget.titleLeft,
                  height: heightItem,
                  defaultDecoration: isLeftItem
                      ? defaultActiveSwitchItemDecoration
                      : defaultInactiveSwitchItemDecoration,
                  defaultStyle: isLeftItem
                      ? defaultActiveSwitchItemStyle
                      : defaultInactiveSwitchItemStyle,
                  alignment: Alignment.center,
                  margin: switchItemMargin,
                  onPress: () {
                    if (isLeftItem) {
                      return;
                    }

                    /// Call event when pressed button
                    if (widget.onLeftPress != null) {
                      widget.onLeftPress();
                    }

                    /// Set state
                    setState(() {
                      isLeftItem = true;
                    });
                  },
                )),

            /// Right button
            Expanded(
                child: Button(
                  widget.titleRight,
                  height: heightItem,
                  defaultDecoration: isLeftItem
                      ? defaultInactiveSwitchItemDecoration
                      : defaultActiveSwitchItemDecoration,
                  defaultStyle: isLeftItem
                      ? defaultInactiveSwitchItemStyle
                      : defaultActiveSwitchItemStyle,
                  alignment: Alignment.center,
                  margin: switchItemMargin,
                  onPress: () {
                    if (!isLeftItem) {
                      return;
                    }

                    /// Call event when pressed button
                    if (widget.onRightPress != null) {
                      widget.onRightPress();
                    }

                    /// Set state
                    setState(() {
                      isLeftItem = false;
                    });
                  },
                ))
          ],
        ));
  }


  /// Init switch butotn
  Widget initSwitchButton(EdgeInsets switchMargin, double height, double heightItem){
    /// In the case width is not set
    return Container(
        margin: switchMargin,
        decoration: defaultSwitchDecoration,
        height: height,
        width: widget.width,
        child: Row(
          children: <Widget>[
            /// Left button
            Expanded(
                child: Button(
                  widget.titleLeft,
                  height: heightItem,
                  defaultDecoration: isLeftItem
                      ? defaultActiveSwitchItemDecoration
                      : defaultInactiveSwitchItemDecoration,
                  defaultStyle: isLeftItem
                      ? defaultActiveSwitchItemStyle
                      : defaultInactiveSwitchItemStyle,
                  alignment: Alignment.center,
                  margin: switchItemMargin,
                  onPress: () {
                    if (isLeftItem) {
                      return;
                    }

                    /// Call event when pressed button
                    if (widget.onLeftPress != null) {
                      widget.onLeftPress();
                    }

                    /// Set state
                    setState(() {
                      isLeftItem = true;
                    });
                  },
                )),

            /// Right button
            Expanded(
                child: Button(
                  widget.titleRight,
                  height: heightItem,
                  defaultDecoration: isLeftItem
                      ? defaultInactiveSwitchItemDecoration
                      : defaultActiveSwitchItemDecoration,
                  defaultStyle: isLeftItem
                      ? defaultInactiveSwitchItemStyle
                      : defaultActiveSwitchItemStyle,
                  alignment: Alignment.center,
                  margin: switchItemMargin,
                  onPress: () {
                    if (!isLeftItem) {
                      return;
                    }

                    /// Call event when pressed button
                    if (widget.onRightPress != null) {
                      widget.onRightPress();
                    }

                    /// Set state
                    setState(() {
                      isLeftItem = false;
                    });
                  },
                ))
          ],
        ));
  }

}
