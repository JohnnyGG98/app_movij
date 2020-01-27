import 'package:app_movij/C/colors.dart';
import 'package:flutter/material.dart';

import 'copy.dart';

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


class PerfilPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final heingt = size.height;
    final width = size.width;
    Paint paint = Paint(); 

    // Pintamos el circulo 
    Path ovalPath = Path(); 
    // Lo bajamos un poco
    ovalPath.moveTo(0, heingt * 0.15); 
    // Pintamos hasta el centro de la pantalla 
    ovalPath.quadraticBezierTo(
      width * 0.45, 
      heingt * 0.25, 
      width * 0.40, 
      heingt * 0.36
    );
    // Lo bajamos hasta el final 
    ovalPath.quadraticBezierTo(
      width * 0.2, 
      heingt * 0.3, 
      width * 0.35, 
      heingt * 0.45
    );


    ovalPath.quadraticBezierTo(
      width * 0.65, 
      heingt * 0.56, 
      width * 0.45, 
      heingt * 0.65
    );


    ovalPath.quadraticBezierTo(
      width * 0.65, 
      heingt * 0.45, 
      width * 0.75, 
      heingt * 0.65
    );

    ovalPath.quadraticBezierTo(
      width, 
      heingt * 0.65, 
      width, 
      heingt * 0.86
    );

    ovalPath.lineTo(width, heingt);

    // Cerramos el ovalo
    ovalPath.lineTo(0, heingt);

    // paint.color =  PRIMARY_COLOR; 
    paint.color =  PRIMARY_COLOR.withOpacity(0.86); 
    canvas.drawPath(ovalPath, paint);
  }

  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}


Widget getFondoInfo() {
  return Center(
    child: Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          height: 110,
          child: Image(
            image: AssetImage('assets/app/ipca.png'),
            fit: BoxFit.contain,
          ),
        ),

        getCopy(PRIMARY_COLOR),
      ],
    ),
  );
}