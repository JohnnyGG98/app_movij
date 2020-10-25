import 'package:flutter/material.dart';

class DefaultFadeTransition<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Duration duration;

  DefaultFadeTransition({
    Key key,
    @required this.child,
    this.duration = const Duration(milliseconds: 600),
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return child;
          },
          transitionDuration: duration,
          transitionsBuilder: (
            BuildContext context,
            Animation animation,
            Animation secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
