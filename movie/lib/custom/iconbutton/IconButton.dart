import 'package:flutter/material.dart';

class IconButton extends StatefulWidget {
  final String iconDefault;
  final String iconHighlight;
  final String iconDisable;
  final bool enable;
  final double width;
  final double height;
  final Function() onPress;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BoxDecoration defaultDecoration;
  final BoxDecoration highlightDecoration;
  final BoxDecoration disableDecoration;
  final Alignment alignment;

  IconButton(this.iconDefault,
      {this.alignment,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.defaultDecoration,
      this.highlightDecoration,
      this.disableDecoration,
      this.enable,
      this.onPress,
      this.iconHighlight,
      this.iconDisable});

  @override
  State<StatefulWidget> createState() {
    return IconButtonState();
  }
}

class IconButtonState extends State<IconButton> {
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
        decoration = widget.disableDecoration;
        icon = widget.iconDisable;
      } else {
        /// Enable status.
        decoration = widget.defaultDecoration;
        icon = widget.iconDefault;
      }
    }

    /// Create UI.
    Widget button = initButton(alignment);

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
        child: Image.asset(icon));
  }

  /// Handle change status
  void changeStatus() {
    if (isHighlight) {
      setState(() {
        /// Change style
        if (widget.highlightDecoration != null) {
          decoration = widget.highlightDecoration;
        }
        if (widget.iconHighlight != null) {
          icon = widget.iconHighlight;
        }
      });
    } else {
      setState(() {
        /// Change style.
        if (widget.defaultDecoration != null) {
          decoration = widget.defaultDecoration;
        }
        if (widget.iconDefault != null) {
          icon = widget.iconDefault;
        }
      });
    }
  }
}
