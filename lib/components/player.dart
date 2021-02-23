import 'dart:ui';

import 'package:app_movij/game_ctr.dart';
import 'package:flame/sprite.dart';

class Player {
  static const IMG_PLAYER = 'tierra.png';
  final GameController gameController;
  int maxHealt;
  int currentHealt;
  Rect playerRect;
  bool isDead = false;
  Sprite sprite;

  Player(this.gameController) {
    maxHealt = currentHealt = 300;
    final size = gameController.tileSize * 1.5;
    playerRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - size / 2,
      gameController.screenSize.height / 2 - size / 2,
      size,
      size,
    );
    sprite = Sprite(IMG_PLAYER);
  }

  void render(Canvas c) {
    Paint color = Paint()..color = Color(0xFF0000FF);
    if (sprite != null) {
      sprite.renderRect(c, playerRect);
    } else {
      c.drawRect(playerRect, color);
    }
  }

  void update(double t) {
    if (!isDead && currentHealt <= 0) {
      isDead = true;
      // Reiniciamos el juegos
      gameController.initialize();
    }
  }
}
