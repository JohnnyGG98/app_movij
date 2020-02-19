

import 'dart:ui';

import 'package:app_movij/game_ctr.dart';

class Enemy {

  final GameController gc; 
  int healt; 
  int damage; 
  double speed; 
  Rect enemyRect;
  bool isDead = false; 

  Enemy(this.gc, double x, double y){
    healt = 1;
    damage = 1;
    speed = gc.tileSize * 2;
    enemyRect = Rect.fromLTWH(
      x, 
      y, 
      gc.tileSize * 1.2, 
      gc.tileSize * 1.2
    );
  }

  void render(Canvas c) {
    Color color; 
    switch(healt) {
      case 1: 
        color = Color(0xFFFF7F7F);
      break;
      case 2:
        color = Color(0xFFFF4C4C);
      break;
      case 3: 
        color = Color(0xFFFF4500);
      break;
      default: 
        color = Color(0XFFFF0000);
      break;
    }

    Paint enemyColor = Paint()..color = color; 
    c.drawRect(enemyRect, enemyColor);
  }

  void update(double t) {
    if (!isDead) {
      double stepDistance = speed * t; 
      Offset toPlayer = gc.player.playerRect.center - enemyRect.center;
      if (stepDistance <= toPlayer.distance - gc.tileSize * 1.25) {
        Offset stepToPlayer = Offset.fromDirection(toPlayer.direction, stepDistance);
        // Con shift movemos de un punto a otro
        enemyRect = enemyRect.shift(stepToPlayer);
      } else {
        attack();
      }
    }
  }

  void attack() {
    if (!gc.player.isDead) {
      gc.player.currentHealt -= damage;
    }
  }

  void onTapDown() {
    if (!isDead) {
      healt--;
      if (healt <= 0) {
        isDead = true; 
        // Putuacion
        gc.score++;
        if ((gc.score ?? 0 ) > (gc.store.getInt('maxscore') ?? 0)) {
          gc.store.setInt('maxscore', gc.score ?? 0);
        }
      }
    }
  }

}