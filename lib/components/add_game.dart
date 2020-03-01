import 'package:app_movij/C/colors.dart';
import 'package:flutter/material.dart';

class AddGame extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final Widget gameWidget = ModalRoute.of(context).settings.arguments;
    if (gameWidget != null) {
      return gameWidget;
    } else {
      return Container(
        color: PRIMARY_COLOR,
        child: Center(
          child: Text('No tenemos un juego...'),
        ),
      );
    }
  }

}