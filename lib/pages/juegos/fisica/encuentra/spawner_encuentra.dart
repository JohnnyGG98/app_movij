
import 'package:app_movij/pages/juegos/fisica/encuentra/encuentra_main.dart';

class SpawnerEncuentra {

  final EncuentraMain em;
  final int maxSpawnInterval = 10000;
  final int minSpawnInterval = 5000;
  final int intervalChange = 5; 
  final int maxPersonajes; 
  int currentInterval;
  int nexSpawn; 

  SpawnerEncuentra(
    this.em, 
    this.maxPersonajes
  ){
    currentInterval = maxSpawnInterval;

    nexSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void update(double t) {
    // Si ya tenemos a todos los personajes ya no hacemos nada 
    if (em.personajes.length >= maxPersonajes) return; 

    int now = DateTime.now().millisecondsSinceEpoch;

    if (em.personajes.length < maxPersonajes && now >= nexSpawn) {
      em.spawn();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
      }

      if (em.speed < em.maxSpeed) {
        em.speed += 25;
      }
      nexSpawn = now + currentInterval;
    }
  }

}