
import 'package:app_movij/game_ctr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ScoreText {
  final GameController gc; 
  TextPainter paint; 
  Offset position; 

  ScoreText(this.gc) {
    paint = TextPainter(
      textAlign: TextAlign.center, 
      textDirection: TextDirection.ltr
    );
    position = Offset.zero;
  }

  void render(Canvas c) {
    paint.paint(c, position);
  }

  void update(double t) {
    if ((paint.text ?? '') != gc.score.toString()) {
      paint.text = TextSpan(
        text: gc.score.toString(),
        style: TextStyle(
          color: Colors.deepOrange, 
          fontSize: 70.0
        )
      );
    }
    paint.layout(); 

    position = Offset(
      (gc.screenSize.width / 2) - (paint.width / 2),
      (gc.screenSize.height * 0.2) - (paint.height / 2)
    );
  }

}