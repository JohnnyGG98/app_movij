
import 'package:app_movij/pages/juegos/fisica/encuentra/encuentra_main.dart';
import 'package:flutter/material.dart';

class TxtInformacionEncontrar {

  TextPainter txtNumEncontrar = TextPainter(textDirection: TextDirection.ltr);
  TextPainter txtNumEncontrados = TextPainter(textDirection: TextDirection.ltr);
  final EncuentraMain em;

  TxtInformacionEncontrar(this.em);
  
  void render(Canvas canvas) {
    txtNumEncontrar.paint(canvas, Offset(
      em.screenSize.width * 0.05, 
      em.screenSize.height * 0.055
    ));
    txtNumEncontrados.paint(canvas, Offset(
      em.screenSize.width * 0.05, 
      em.screenSize.height * 0.95
    ));
  }

  void update(double t) {
    _renderPuntuacion();
    _renderNumEncontrar();
  }

  void _renderNumEncontrar() {
    txtNumEncontrar.text = TextSpan(
      text: 'Se debe encontrar ${em.numEncontrar} figuras.' ,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white
      )
    );
    txtNumEncontrar.layout();
  }

  void _renderPuntuacion() {
    txtNumEncontrados.text = TextSpan(
      text: 'Encontramos: ' + em.puntuacion.toString(),
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white
      )
    );
    txtNumEncontrados.layout();
  }
  
}