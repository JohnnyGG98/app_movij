import 'package:app_movij/C/colors.dart';
import 'package:flutter/material.dart';

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final heingt = size.height;
    final width = size.width;
    Paint paint = Paint(); 

    Path mainBackgroud = Path(); 
    mainBackgroud.addRect(Rect.fromLTRB(0, 0, width, heingt));
    paint.color = Colors.blue.shade700;
    canvas.drawPath(mainBackgroud, paint); 

    // Pintamos el circulo 
    Path ovalPath = Path(); 
    // Lo bajamos un poco
    ovalPath.moveTo(0, heingt * 0.2); 
    // Pintamos hasta el centro de la pantalla 
    ovalPath.quadraticBezierTo(
      width * 0.45, 
      heingt * 0.25, 
      width * 0.55, 
      heingt * 0.50
    );
    // Lo bajamos hasta el final 
    ovalPath.quadraticBezierTo(
      width * 0.6, 
      heingt * 0.8, 
      width * 0.1, 
      heingt 
    );

    // Cerramos el ovalo
    ovalPath.lineTo(0, heingt);

    paint.color = Colors.blue.shade600; 
    canvas.drawPath(ovalPath, paint);
  }

  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}


class HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final heingt = size.height;
    final width = size.width;
    Paint paint = Paint(); 

    Path mainBackgroud = Path(); 
    mainBackgroud.addRect(Rect.fromLTRB(0, 0, width, heingt));
    paint.color = PRIMARY_COLOR;
    canvas.drawPath(mainBackgroud, paint); 

    Path triangulo = Path(); 
    triangulo.moveTo(width / 2, heingt * 0.8); 
    triangulo.lineTo(0, heingt * 0.95);
    triangulo.lineTo(0, heingt);
    triangulo.lineTo(width, heingt);
    triangulo.lineTo(width, heingt * 0.95);
    

    paint.color = Colors.white;
    canvas.drawPath(triangulo, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}