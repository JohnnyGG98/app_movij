import 'dart:ui';

import 'package:app_movij/game_ctr.dart';
import 'package:flame/sprite.dart';

class Enemy {
  static const IMG_ENEMY = 'cometa.png';
  final GameController gc;
  int healt;
  int damage;
  double speed;
  Rect enemyRect;
  bool isDead = false;
  Sprite sprite;

  Enemy(this.gc, double x, double y, String img) {
    healt = 1;
    damage = 1;
    speed = gc.tileSize * 2;
    enemyRect = Rect.fromLTWH(
      x,
      y,
      gc.tileSize * 1.2,
      gc.tileSize * 1.2,
    );
    sprite = Sprite(img);
  }

  void render(Canvas c) {
    sprite.renderRect(c, enemyRect);
  }

  void update(double t) {
    if (!isDead) {
      double stepDistance = speed * t;
      Offset toPlayer = gc.player.playerRect.center - enemyRect.center;
      if (stepDistance <= toPlayer.distance - gc.tileSize * 1.25) {
        Offset stepToPlayer =
            Offset.fromDirection(toPlayer.direction, stepDistance);
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
        if ((gc.score ?? 0) > (gc.store.getInt('maxscore') ?? 0)) {
          gc.store.setInt('maxscore', gc.score ?? 0);
        }
      }
    }
  }
}
