
import 'package:app_movij/game_ctr.dart';

class EnemySpawner {

  final GameController gc;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 700;
  final int intervalChange = 3; 
  final int maxEnemies = 7; 
  int currentInterval;
  int nexSpawn; 

  EnemySpawner(this.gc){
    initialize(); 
  }

  void initialize() {
    killAllEnemies();
    currentInterval = maxSpawnInterval;
    nexSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval; 
  }

  void killAllEnemies() {
    gc.enemies.forEach((e) => e.isDead = true);
  }

  void update(double t) {
    int now = DateTime.now().millisecondsSinceEpoch;

    if (gc.enemies.length < maxEnemies && now >= nexSpawn) {
      gc.spawnEnemy();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * 0.1).toInt();
      }
      nexSpawn = now + currentInterval;
    }
  }

}