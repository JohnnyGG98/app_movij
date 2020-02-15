import 'dart:ui';

import 'package:app_movij/game_ctr.dart';

class Player {

  final GameController gameController;
  int maxHealt;
  int currentHealt;
  Rect playerRect; 
  bool isDead = false;

  Player(this.gameController){
    maxHealt = currentHealt = 300;
    final size = gameController.tileSize * 1.5;
    playerRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - size / 2, 
      gameController.screenSize.height / 2 - size / 2, 
      size, 
      size
    ); 
  }

  void render(Canvas c) {
    Paint color = Paint()..color = Color(0xFF0000FF); 
    c.drawRect(playerRect, color);
  }

  void update(double t) {
    if (!isDead && currentHealt <= 0) {
      isDead = true; 
      // Reiniciamos el juegos 
      gameController.initialize();
    }
  }

} 