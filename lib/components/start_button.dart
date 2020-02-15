
import 'package:app_movij/game_ctr.dart';
import 'package:flutter/material.dart';


class StartButton {

  final GameController gc; 
  TextPainter painter; 
  Offset position; 

  StartButton(this.gc) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    );
    position = Offset.zero;
  }

   void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    painter.text = TextSpan(
      text: 'Tap\npara\njugar',
      style: TextStyle(
        color: Colors.amber, 
        fontSize: 70.0
      )
    );
    
    painter.layout(); 

    position = Offset(
      (gc.screenSize.width / 2) - (painter.width / 2),
      (gc.screenSize.height * 0.5) - (painter.height / 2)
    );
  }

}