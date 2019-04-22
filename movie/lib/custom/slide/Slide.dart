import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie/custom/slide/SlideChange.dart';
import 'package:movie/custom/slide/SlideItem.dart';
import 'package:movie/middle/model/ScreenSize.dart';
import 'package:movie/utils/ListPhysics.dart';

class Slide extends StatelessWidget {
  /// Margin
  static const double MARGIN = 25.0;

  /// Space
  static const double SPACE = 50.0;

  /// Size of screen
  final ScreenSize size;

  /// Widget
  final List<Widget> widgets;

  /// Callback to change slide.
  final ValueChanged<SlideChange> callback;

  /// Padding and margin.
  final bool isSpace;

  /// Items will loaded after init, default is 1.
  final int offset;

  /// Outside to call for change slide
  final Stream<double> stream;

  /// Allow scroll
  final bool isScrolled;

  /// Constructor
  Slide(this.size, this.widgets, this.callback,
      {this.isSpace, this.offset = 1, this.stream, this.isScrolled});

  /// Transfer between pages.
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<SlideItem> data = [];

    /// Add data
    for (int index = 0; index < widgets.length; index++) {
      if (index == 0) {
        /// Begin
        if (isSpace == null || !isSpace) {
          data.add(SlideItem(size, widgets[index], left: MARGIN));
        } else {
          data.add(
              SlideItem(size, widgets[index], left: MARGIN, isSpace: isSpace));
        }
      } else if (index == widgets.length - 1) {
        /// End
        if (isSpace == null || !isSpace) {
          data.add(SlideItem(size, widgets[index], right: MARGIN));
        } else {
          data.add(
              SlideItem(size, widgets[index], right: MARGIN, isSpace: isSpace));
        }
      } else {
        if (isSpace == null || !isSpace) {
          data.add(SlideItem(size, widgets[index]));
        } else {
          data.add(SlideItem(size, widgets[index], isSpace: isSpace));
        }
      }
    }

    /// Scroll is horizontal or vertical
    ScrollDirection direction;

    /// Velocity when swiping.
    double velocity;

    /// Scroll to position
    double start = 0;

    /// Position of item
    double position = 0;

    /// Cache extent.
    double cacheExtent = 0;
    if (widgets.length < 2) {
      cacheExtent = size.width.toDouble() * (this.widgets.length - 1);
    } else {
      if (this.offset == null || this.offset < 2) {
        cacheExtent = size.width.toDouble() * (this.widgets.length - 1);
      } else {
        cacheExtent = size.width.toDouble() * (this.offset - 1) -
            size.width.toDouble() / 2;
      }
    }

    ScrollPhysics scrollPhysics;
    if (isScrolled == null || isScrolled) {
      scrollPhysics = ListPhysics((param) {
        velocity = param;
      });
    } else {
      scrollPhysics = NeverScrollableScrollPhysics();
    }

    /// Listen to change slide
    if (stream != null) {
      stream.listen((slide) {
        if (slide > data.length || slide < 1) {
          return;
        }
        position = slide - 1;
        if (isSpace == null || !isSpace) {
          start = size.width.toDouble() * position;
        } else {
          start = (size.width.toDouble() - SPACE) * position;
        }
        controller.jumpTo(start);
      });
    }

    /// Create UI.
    return NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (!(notification is UserScrollNotification)) {
            return;
          }

          if ((notification as UserScrollNotification).direction ==
              ScrollDirection.idle) {
            /// Width when swipe.
            double delta = controller.offset - start;

            if (direction == ScrollDirection.forward) {
              /// Scroll out side
              if (controller.offset <= 0) {
                controller.jumpTo(0);
                return;
              }

              /// Swipe from right to left
              if (velocity != null && velocity.abs() < GLOBAL_VELOCITY) {
                /// If velocity is less than 1500
                if (delta < (size.width).toDouble() / 2) {
                  /// Allow to change page
                  if ((position - 1) >= 0) {
                    /// Change slide
                    position--;
                    if (isSpace == null || !isSpace) {
                      start = size.width.toDouble() * position;
                    } else {
                      start = (size.width.toDouble() - SPACE) * position;
                    }
                    controller.jumpTo(start);

                    /// Callback to handle change slide.
                    callback(SlideChange(
                        position.toInt(), widgets[position.toInt()]));
                  }
                } else {
                  /// Don't allow to change page
                  controller.jumpTo(start);
                }
              } else {
                /// If velocity is larger than 1500
                if ((position - 1) >= 0) {
                  /// Change slide
                  position--;
                  if (isSpace == null || !isSpace) {
                    start = size.width.toDouble() * position;
                  } else {
                    start = (size.width.toDouble() - SPACE) * position;
                  }
                  controller.jumpTo(start);

                  /// Callback to handle change slide.
                  callback(
                      SlideChange(position.toInt(), widgets[position.toInt()]));
                }
              }
            } else {
              /// Scroll out side
              double limit = 0;
              if (isSpace == null || !isSpace) {
                limit = size.width.toDouble() * (data.length - 1);
              } else {
                limit = (size.width.toDouble() - SPACE) * (data.length - 1);
              }

              if (controller.offset >= limit) {
                controller.jumpTo(start);
                return;
              }

              /// Swipe from right to left
              if (velocity != null && velocity.abs() < GLOBAL_VELOCITY) {
                /// If velocity is less than 1500
                if (delta < size.width.toDouble() / 2) {
                  /// Don't allow to change page
                  controller.jumpTo(start);
                } else {
                  /// Allow to change page
                  if ((position + 1) < data.length) {
                    /// Change slide
                    position++;
                    if (isSpace == null || !isSpace) {
                      start = size.width.toDouble() * position;
                    } else {
                      start = (size.width.toDouble() - SPACE) * position;
                    }
                    controller.jumpTo(start);

                    /// Callback to handle change slide.
                    callback(SlideChange(
                        position.toInt(), widgets[position.toInt()]));
                  }
                }
              } else {
                /// If velocity is larger than 1500
                /// Check jump out of pages
                if ((position + 1) < data.length) {
                  /// Change slide
                  position++;
                  if (isSpace == null || !isSpace) {
                    start = size.width.toDouble() * position;
                  } else {
                    start = (size.width.toDouble() - SPACE) * position;
                  }
                  controller.jumpTo(start);

                  /// Callback to handle change slide.
                  callback(
                      SlideChange(position.toInt(), widgets[position.toInt()]));
                }
              }
            }
          } else {
            direction = (notification as UserScrollNotification).direction;
          }
        },
        child: ListView(
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            children: data.map((item) {
              return item;
            }).toList(),
            cacheExtent: cacheExtent,
            controller: controller,
            physics: scrollPhysics));
  }
}
