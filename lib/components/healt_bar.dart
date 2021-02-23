

import 'dart:ui';

import 'package:app_movij/game_ctr.dart';


class HealtBar {

  final GameController gc; 
  double barWidth; 
  Rect healtBarRect; 
  Rect actualHealtBarRect;

  HealtBar(this.gc) {
    barWidth = gc.screenSize.width / 1.75;
    healtBarRect = Rect.fromLTWH(
      gc.screenSize.width / 2 - barWidth / 2, 
      gc.screenSize.height * 0.8, 
      barWidth, 
      gc.tileSize * 0.5
    );

    actualHealtBarRect = Rect.fromLTWH(
      gc.screenSize.width / 2 - barWidth / 2, 
      gc.screenSize.height * 0.8, 
      barWidth, 
      gc.tileSize * 0.5
    );
  } 


  void render(Canvas c) {
    Paint healtColor = Paint()..color = Color(0xFFC8151D);
    Paint actualHealtColor = Paint()..color = Color(0xFF00BB35);

    c.drawRect(healtBarRect, healtColor);
    c.drawRect(actualHealtBarRect, actualHealtColor);
  }

  void update(double t) {
    double porcentajeHealt = gc.player.currentHealt / gc.player.maxHealt; 
    actualHealtBarRect = Rect.fromLTWH(
      gc.screenSize.width / 2 - barWidth / 2, 
      gc.screenSize.height * 0.8, 
      barWidth * porcentajeHealt, 
      gc.tileSize * 0.5
    );
  }



}