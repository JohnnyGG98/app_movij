import 'package:flutter/material.dart';

class GameContainer extends StatelessWidget {
  final Widget widget;

  const GameContainer({
    Key key,
    @required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: this.widget);
  }
}
