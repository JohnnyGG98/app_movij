
import 'package:app_movij/game_ctr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MaxScoreText {
  final GameController gc; 
  TextPainter paint; 
  Offset position; 

  MaxScoreText(this.gc) {
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
    int maxScore = gc.store.getInt('maxscore') ?? 0;
    paint.text = TextSpan(
      text: 'Puntuacion\nmaxima\n' + maxScore.toString(),
      style: TextStyle(
        color: Colors.black, 
        fontSize: 50.0
      )
    );
    
    paint.layout(); 

    position = Offset(
      (gc.screenSize.width / 2) - (paint.width / 2),
      (gc.screenSize.height * 0.2) - (paint.height / 2)
    );
  }

}