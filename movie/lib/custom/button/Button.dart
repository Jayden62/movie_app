import 'package:flutter/material.dart';
import 'package:movie/base/style/BaseStyle.dart';

class Button extends StatefulWidget {
  final TextStyle highlightStyle;
  final TextStyle defaultStyle;
  final TextStyle disableStyle;
  final BoxDecoration defaultDecoration;
  final BoxDecoration highlightDecoration;
  final BoxDecoration disableDecoration;
  final String label;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double width;
  final double height;
  final Function() onPress;
  final Alignment alignment;
  final bool enable;
  final IconButton iconButton;

  Button(this.label,
      {this.alignment,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.defaultStyle,
      this.highlightStyle,
      this.defaultDecoration,
      this.highlightDecoration,
      this.disableStyle,
      this.disableDecoration,
      this.enable,
      this.onPress,
      this.iconButton});

  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<Button> {
  TextStyle style;
  BoxDecoration decoration;
  String icon;
  bool isHighlight = false;

  @override
  Widget build(BuildContext context) {
    /// Alignment
    Alignment alignment = Alignment.center;
    if (widget.alignment != null) {
      alignment = widget.alignment;
    }

    if (!isHighlight) {
      if (widget.enable != null && !widget.enable) {
        /// Disable status.
        style = widget.disableStyle;
        decoration = widget.disableDecoration;
        if (widget.iconButton != null) {
          icon = widget.iconButton.iconDisable;
        }
      } else {
        /// Enable status.
        style = widget.defaultStyle;
        decoration = widget.defaultDecoration;
        if (widget.iconButton != null) {
          icon = widget.iconButton.iconDefault;
        }
      }
    }

    /// Create UI.
    Widget button;
    if (widget.iconButton == null) {
      button = initButton(alignment);
    } else if (widget.iconButton.iconPosition == IconPosition.left) {
      button = initLeftIconButton(alignment);
    } else if (widget.iconButton.iconPosition == IconPosition.right) {
      button = initRightIconButton(alignment);
    } else if (widget.iconButton.iconPosition == IconPosition.top) {
      button = initTopIconButton(alignment);
    } else {
      button = initBottomIconButton(alignment);
    }

    return GestureDetector(
        onTapDown: (TapDownDetails details) {
          /// Exit if status is disable.
          if (widget.enable != null && !widget.enable) {
            return;
          }
          isHighlight = true;
          changeStatus();
        },
        onTapUp: (TapUpDetails details) async {
          /// Exit if status is disable.
          if (widget.enable != null && !widget.enable) {
            return;
          }

          /// Highlight
          await Future.delayed(const Duration(milliseconds: 100));
          isHighlight = false;
          changeStatus();
          if (widget.onPress != null) {
            widget.onPress();
          }
        },
        onTapCancel: () {
          /// Exit if status is disable.
          if (widget.enable != null && !widget.enable) {
            return;
          }
          isHighlight = false;
          changeStatus();
        },
        child: button);
  }

  /// Init button
  Widget initButton(Alignment alignment) {
    return Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        padding: widget.padding,
        decoration: decoration,
        alignment: alignment,
        child: Text(widget.label, style: style));
  }

  /// Init left icon button
  Widget initLeftIconButton(Alignment alignment) {
    return Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        padding: widget.padding,
        decoration: decoration,
        alignment: alignment,
        child: Row(
          mainAxisSize: widget.iconButton.mainAxisSize == null
              ? MainAxisSize.min
              : widget.iconButton.mainAxisSize,
          children: <Widget>[
            Container(
                child: Image.asset(icon),
                width: widget.iconButton.iconWidth,
                height: widget.iconButton.iconHeight),
            Text(widget.label, style: style)
          ],
        ));
  }

  /// Init right icon button
  Widget initRightIconButton(Alignment alignment) {
    return Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        padding: widget.padding,
        decoration: decoration,
        alignment: alignment,
        child: Row(
          mainAxisSize: widget.iconButton.mainAxisSize == null
              ? MainAxisSize.min
              : widget.iconButton.mainAxisSize,
          children: <Widget>[
            Text(widget.label, style: style),
            Container(
                child: Image.asset(icon),
                width: widget.iconButton.iconWidth,
                height: widget.iconButton.iconHeight)
          ],
        ));
  }

  /// Init top icon button
  Widget initTopIconButton(Alignment alignment) {
    return Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        padding: widget.padding,
        decoration: decoration,
        alignment: alignment,
        child: Column(
          mainAxisSize: widget.iconButton.mainAxisSize == null
              ? MainAxisSize.min
              : widget.iconButton.mainAxisSize,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: smallestMargin),
                child: Image.asset(icon),
                width: widget.iconButton.iconWidth,
                height: widget.iconButton.iconHeight),
            Text(widget.label, style: style)
          ],
        ));
  }

  /// Init bottom icon button
  Widget initBottomIconButton(Alignment alignment) {
    return Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        padding: widget.padding,
        decoration: decoration,
        alignment: alignment,
        child: Column(
          mainAxisSize: widget.iconButton.mainAxisSize == null
              ? MainAxisSize.min
              : widget.iconButton.mainAxisSize,
          children: <Widget>[
            Text(widget.label, style: style),
            Container(
                child: Image.asset(icon),
                width: widget.iconButton.iconWidth,
                height: widget.iconButton.iconHeight)
          ],
        ));
  }

  /// Handle change status
  void changeStatus() {
    if (isHighlight) {
      setState(() {
        /// Change style
        if (widget.highlightStyle != null) {
          style = widget.highlightStyle;
        }
        if (widget.highlightDecoration != null) {
          decoration = widget.highlightDecoration;
        }
        if (widget.iconButton != null &&
            widget.iconButton.iconHighlight != null) {
          icon = widget.iconButton.iconHighlight;
        }
      });
    } else {
      setState(() {
        /// Change style.
        if (widget.defaultStyle != null) {
          style = widget.defaultStyle;
        }
        if (widget.defaultDecoration != null) {
          decoration = widget.defaultDecoration;
        }
        if (widget.iconButton != null &&
            widget.iconButton.iconDefault != null) {
          icon = widget.iconButton.iconDefault;
        }
      });
    }
  }
}

class IconButton {
  final String iconDefault;
  final String iconHighlight;
  final String iconDisable;
  final double iconWidth;
  final double iconHeight;
  final IconPosition iconPosition;
  final MainAxisSize mainAxisSize;

  IconButton(
      this.iconDefault, this.iconPosition, this.iconHeight, this.iconWidth,
      {this.iconHighlight, this.iconDisable, this.mainAxisSize});
}

enum IconPosition { left, right, top, bottom }
