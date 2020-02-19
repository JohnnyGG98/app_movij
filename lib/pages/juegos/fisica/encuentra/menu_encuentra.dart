
import 'package:app_movij/pages/juegos/fisica/encuentra/encuentra_main.dart';
import 'package:flutter/material.dart';

class MenuEncuentra {

  final EncuentraMain em;
  TextPainter titulo; 
  Offset posTitulo;
  TextPainter continuar;
  Offset posContinuar; 
  Rect hitBoxContinuar;
  TextPainter nuevo;
  Offset posNuevo;
  Rect hitBoxNuevo; 
  TextPainter salir;
  Offset posSalir;
  Rect hitBoxSalir;

  // Color transparente
  Paint _colorTransparente = Paint()..color = Colors.transparent; 

  MenuEncuentra(this.em) {
    _iniciarComponentes();
  }

  void _iniciarComponentes() {
    _initTitulo();
    _initContinuar();
    _initNuevo();
    _initSalir();
  }

  void render(Canvas canvas) {
    titulo.paint(canvas, posTitulo);
    canvas.drawRect(hitBoxContinuar, _colorTransparente);
    continuar.paint(canvas, posContinuar);
    canvas.drawRect(hitBoxNuevo, _colorTransparente);
    nuevo.paint(canvas, posNuevo);
    canvas.drawRect(hitBoxSalir, _colorTransparente);
    salir.paint(canvas, posSalir);
  }

  void update(double t) {
    titulo.layout();
    continuar.layout();
    nuevo.layout();
    salir.layout();
  }

  void _initTitulo() {
    titulo = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    titulo.text = TextSpan(
      text: 'Menu',
      style: TextStyle(
        color: Colors.white, 
        fontSize: 50.0
      )
    );

    titulo.layout();

    posTitulo = Offset(
      (em.screenSize.width / 2) - (titulo.width / 2),
      (em.screenSize.height * 0.20) - (titulo.height / 2) 
    );
  }


  void _initContinuar() {
    continuar = _formatoOpcion('Continuar');
    posContinuar = Offset(
      (em.screenSize.width / 2) - (continuar.width / 2),
      (em.screenSize.height * 0.30) - (continuar.height / 2) 
    );

    hitBoxContinuar = Rect.fromLTWH(
      (em.screenSize.width / 2) - (continuar.width / 2),
      (em.screenSize.height * 0.30) - (continuar.height / 2),
      continuar.width,
      continuar.height
    );
  }

  void _initNuevo() {
    nuevo = _formatoOpcion('Nuevo');
    posNuevo = Offset(
      (em.screenSize.width / 2) - (nuevo.width / 2),
      (em.screenSize.height * 0.40) - (nuevo.height / 2),
    );

    hitBoxNuevo = Rect.fromLTWH(
      posNuevo.dx,
      posNuevo.dy,
      nuevo.width,
      nuevo.height
    );
  }

  void _initSalir() {
    salir = _formatoOpcion('Salir');
    posSalir = Offset(
      (em.screenSize.width / 2) - (salir.width / 2),
      (em.screenSize.height * 0.50) - (salir.height / 2),
    );

    hitBoxSalir = Rect.fromLTWH(
      posSalir.dx,
      posSalir.dy,
      salir.width,
      salir.height
    );
  }

  TextPainter _formatoOpcion(String texto) {
    TextPainter opt = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    opt.text = TextSpan(
      text: texto,
      style: TextStyle(
        color: Colors.white, 
        fontSize: 40.0
      )
    );
    opt.layout();
    return opt;
  }

}