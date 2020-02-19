
import 'package:flutter/material.dart';

class BotonPausa {

  IconData _icon;
  TextPainter iconPausa = TextPainter(textDirection: TextDirection.rtl);
  Rect hitBox;
  Size _screenSize;

  BotonPausa(this._screenSize);

  void render(Canvas canvas) {
    jugar();

    iconPausa.paint(canvas, Offset(
      _screenSize.width - iconPausa.width, 
      iconPausa.height
    ));
    hitBox = Rect.fromLTWH(
      _screenSize.width - iconPausa.width, 
      iconPausa.height,
      iconPausa.width, 
      iconPausa.height
    );
    Paint coloTransparente = Paint()..color = Colors.transparent; 
    canvas.drawRect(hitBox, coloTransparente);
  }

  void pausar() {
    _icon = Icons.play_arrow;
    // Actualizamos el icono 
    iconPausa.text = TextSpan(
      text: String.fromCharCode(_icon.codePoint),
      style: TextStyle(
        fontSize: 40.0,
        fontFamily: _icon.fontFamily,
        color: Colors.white
      )
    );
    iconPausa.layout();
  }

  void jugar() {
    _icon = Icons.pause;
    // Actualizamos el icono 
    iconPausa.text = TextSpan(
      text: String.fromCharCode(_icon.codePoint),
      style: TextStyle(
        fontSize: 40.0,
        fontFamily: _icon.fontFamily,
        color: Colors.white
      )
    );
    iconPausa.layout();
  }

}