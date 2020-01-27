import 'package:app_movij/templates/btn_juego.dart';
import 'package:app_movij/templates/fondo.dart';
import 'package:flutter/material.dart';

class JuegosTLPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          getFondoInfo(),
          ListView(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            children: <Widget>[
              
              getBtnJuego('Tiempo'),
              SizedBox(height: 35,),
              getBtnJuego('Luz'),
              SizedBox(height: 35,),
              getBtnJuego('Hora'),
              SizedBox(height: 35,),
              getBtnJuego('Cantidad'),
              SizedBox(height: 35,),
              getBtnJuego('Pictogramas'),
            ],
          )
        ],
      ),
    );
  }
}