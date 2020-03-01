
import 'package:app_movij/pages/juegos/fisica/encuentra/encuentra_main.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';

class FeedbackGame {

  final EncuentraMain em;
  final String iconName; 
  Sprite sprite;
  Rect _hitBox;
  bool mostrar = false;
  double _tiempo = 0;
  static const double _ESIZE = 175;


  FeedbackGame({
    @required this.em, 
    @required this.iconName
  }){
    _init();
  }

  _init() {
    sprite = new Sprite(iconName);
    _hitBox = Rect.fromLTWH(
      (em.screenSize.width / 2) - (_ESIZE / 2),
      (em.screenSize.height / 2) - (_ESIZE / 2), 
      _ESIZE, 
      _ESIZE
    );
  }

  void render(Canvas c) {
    if (mostrar) {
      sprite.renderRect(c, _hitBox);
    }
  }

  void update(double t) {
    if (mostrar) {
      _tiempo += t;
      if (_tiempo > 0.75) {
        mostrar = false;
      }
    }
    
  }

  void mostrarSprite() {
    mostrar = true; 
    _tiempo = 0;
  }

}