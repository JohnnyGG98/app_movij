import 'dart:math';
import 'dart:ui';
import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/encuentra_main.dart';
import 'package:flame/sprite.dart';

final Random rand = Random();
const double P_SIZE = 60;

class PersonajeEncuentra {
  final EncuentraMain em;
  Rect personaje;
  bool encontrado;
  Offset posToTraslate;
  bool paraEncontrar;
  String img;
  Sprite sprite;
  double _tiempoEspera = 0;

  PersonajeEncuentra(this.em, this.paraEncontrar, this.img) {
    _spawn();
    encontrado = false;
    posToTraslate = _getRandomOffset();
    sprite = Sprite(img);
  }

  void render(Canvas c) {
    Paint color = Paint()..color = AppThemeColors.GREEN;
    if (img != '') {
      sprite.renderRect(c, personaje);
    } else {
      c.drawRect(personaje, color);
    }
  }

  void update(double t) {
    if (encontrado && paraEncontrar) {
      encontrado = false;
      posToTraslate = _getRandomOffset();

      personaje = personaje.translate(posToTraslate.dx, posToTraslate.dy);
    } else {
      double distance = em.speed * t;
      Offset toPos = posToTraslate - personaje.center;

      if (distance <= toPos.distance) {
        Offset stepToPos = Offset.fromDirection(toPos.direction, distance);
        personaje = personaje.shift(stepToPos);
      } else {
        _tiempoEspera += t;
        if (!paraEncontrar && _tiempoEspera > 3) {
          posToTraslate = _getRandomOffset();
        }

        if (paraEncontrar && _tiempoEspera > 10) {
          posToTraslate = _getRandomOffset();
        }
      }
    }
  }

  bool onTapDowm() {
    if (!encontrado && paraEncontrar) {
      encontrado = true;
      em.smileSprite.mostrarSprite();
      em.puntuacion++;
    } else {
      em.sadSprite.mostrarSprite();
      em.puntuacion -= 2;
      if (em.puntuacion < 0) {
        em.puntuacion = 0;
      }
    }
    return encontrado;
  }

  Offset _getRandomOffset() {
    _tiempoEspera = 0;
    double x, y;
    switch (rand.nextInt(4)) {
      case 0:
        // Solo arriba
        x = rand.nextDouble() * em.screenSize.width;
        y = 0;
        break;
      case 1:
        // Solo en la derecha
        x = em.screenSize.width - (P_SIZE * 2.5);
        y = rand.nextDouble() * em.screenSize.height;
        break;
      case 2:
        // Solo abajo
        x = rand.nextDouble() * em.screenSize.width;
        y = em.screenSize.height;
        break;
      case 3:
        // Solo izquierda
        x = P_SIZE * 2.5;
        y = rand.nextDouble() * em.screenSize.height;
        break;
    }

    // Para que no se pase de la pantalla
    if (y > (em.screenSize.height / 2)) {
      y = y - P_SIZE * 2.5;
    } else {
      y = y + P_SIZE * 2.5;
    }

    return Offset(x, y);
  }

  void _spawn() async {
    double x, y;
    switch (rand.nextInt(4)) {
      case 0:
        // Solo arriba
        x = rand.nextDouble() * em.screenSize.width;
        y = -P_SIZE * 2.5;
        break;
      case 1:
        // Solo en la derecha
        x = em.screenSize.width + P_SIZE * 2.5;
        y = rand.nextDouble() * em.screenSize.height;
        break;
      case 2:
        // Solo abajo
        x = rand.nextDouble() * em.screenSize.width;
        y = em.screenSize.height + P_SIZE * 2.5;
        break;
      case 3:
        // Solo izquierda
        x = -P_SIZE * 2.5;
        y = rand.nextDouble() * em.screenSize.height;
        break;
    }

    personaje = Rect.fromLTWH(x, y, P_SIZE, P_SIZE);
  }
}
