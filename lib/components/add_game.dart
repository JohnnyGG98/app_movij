import 'package:app_movij/config/config_export.dart';
import 'package:flutter/material.dart';

class AddGame extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final Widget gameWidget = ModalRoute.of(context).settings.arguments;
    if (gameWidget != null) {
      return gameWidget;
    } else {
      return Container(
        color: AppThemeColors.BLUE,
        child: Center(
          child: Text('No tenemos un juego...'),
        ),
      );
    }
  }

}