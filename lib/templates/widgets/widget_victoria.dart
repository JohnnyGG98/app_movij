import 'package:app_movij/C/cons.dart';
import 'package:flutter/material.dart';

Widget baileVictoria(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: 330,
            width: 330,
            child: Image.asset('assets/images/gatito-kawaii.gif'),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.10,
          right: MediaQuery.of(context).size.width * 0.10,
          child: Text('Ganaste ¡Felicidades!\n\nEdison Alexander', 
            style: TextStyle(
              fontSize: 30.0, 
              letterSpacing: 3,
              fontWeight: FontWeight.w500,
              fontFamily: FONT_FAMILY_CONSOLA
            ),
            textAlign: TextAlign.center,
          )
        )
      ],
    )
  );
}