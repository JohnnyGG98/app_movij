import 'package:app_movij/widgets/menu/menu_lateral.dart';
import 'package:flutter/material.dart';

import 'description_game.dart';

class PageGame extends StatelessWidget {
  final String title;
  final String text;
  final String label;
  final Widget child;

  const PageGame({
    Key key,
    @required this.title,
    @required this.text,
    @required this.label,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MenuLateral(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DescriptionGame(
            text: text,
            label: label,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
