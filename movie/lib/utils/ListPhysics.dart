import 'package:flutter/material.dart';

/// We get velocity when user is swiping
//double globalVelocity = 0.0;
/// Define minimum velocity. Allow move other page if velocity is larger than 1500.0
const double GLOBAL_VELOCITY = 1500.0;

class ListPhysics extends ScrollPhysics {

  final ValueChanged<double> callback;

  /// Creates scroll physics that bounce back from the edge.
   const ListPhysics(this.callback,{ScrollPhysics parent
  }) : super(parent: parent);

  @override
  ListPhysics applyTo(ScrollPhysics ancestor) {
    return ListPhysics(callback, parent: buildParent(ancestor));
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {

     super.createBallisticSimulation(position, velocity);

//    globalVelocity = velocity;

    callback(velocity);

    return null;
  }
}
