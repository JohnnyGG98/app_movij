import 'package:flutter/material.dart';

class AddGame extends StatelessWidget {

  Widget gameWidget;
  
  @override
  Widget build(BuildContext context) {
    gameWidget = ModalRoute.of(context).settings.arguments;
    if (gameWidget != null) {
      return gameWidget;
    } else {
      return Container(
        child: Center(
          child: Text('No tenemos un juego...'),
        ),
      );
    }
    
  }
}