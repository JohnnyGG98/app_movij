import 'package:app_movij/templates/btn_juego.dart';
import 'package:app_movij/templates/fondo.dart';
import 'package:flutter/material.dart';

class JuegosTFPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          getFondoInfo(),
          ListView(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            children: <Widget>[
              getBtnJuego('Encuentra'),
              SizedBox(height: 35,),
              getBtnJuego('Sigue'),
              SizedBox(height: 35,),
              getBtnJuego('Camina'),
              SizedBox(height: 35,),
              getBtnJuego('Ordena'),
              SizedBox(height: 35,),
              getBtnJuego('Otros'),
            ],
          )
        ],
      ),
    );
  }
}