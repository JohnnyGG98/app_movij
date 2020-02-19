import 'dart:math';
import 'dart:ui';
import 'package:app_movij/C/colors.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/encuentra_main.dart';
import 'package:flame/sprite.dart';

final Random rand = Random();
const double P_SIZE = 50;

class PersonajeEncuentra {

  final EncuentraMain em; 
  Rect personaje; 
  bool encontrado; 
  Offset posToTraslate;
  bool paraEncontrar;
  String img;

  Sprite sprite;

  Image image;

  PersonajeEncuentra(this.em, this.paraEncontrar, this.img){
    _spawn();  
    encontrado = false; 
    posToTraslate = _getRandomOffset();
    sprite = Sprite(img);
  }

  void render(Canvas c) {
    Paint color = Paint()..color = ACCENT_COLOR;
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
        if (!paraEncontrar) {
          posToTraslate = _getRandomOffset();
        }
      }
    }
  }

  void onTapDowm() {
    if (!encontrado && paraEncontrar) {
      encontrado = true;
    }
  }

  Offset _getRandomOffset() {
    return Offset(
      rand.nextDouble() * (em.screenSize.width - P_SIZE), 
      rand.nextDouble() * (em.screenSize.height - P_SIZE)
    );
  }

  void _spawn() async {
    double x, y; 
    switch(rand.nextInt(4)) {
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

    personaje = Rect.fromLTWH(
      x, 
      y, 
      P_SIZE, 
      P_SIZE
    );
  }

}
