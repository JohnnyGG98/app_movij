import 'package:app_movij/templates/btn_juego.dart';
import 'package:app_movij/templates/widgets/widgets_menu_juego.dart';
import 'package:flutter/material.dart';

class JuegosTLPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return getListaJuegos(
      context, 
      'Terapia Lenguaje', 
      _btns
    );
  }

  List<Widget> _btns(BuildContext context) {
    return [
      getBtnJuego('Tiempo', () {}),
      SizedBox(height: 35,),
      getBtnJuego('Luz', () {}),
      SizedBox(height: 35,),
      getBtnJuego('Hora', (){}),
      SizedBox(height: 35,),
      getBtnJuego('Cantidad', () {}),
      SizedBox(height: 35,),
      getBtnJuego('Pictogramas', (){}),
    ];
  }

}