import 'package:app_movij/game_ctr.dart';
import 'package:app_movij/templates/btn_juego.dart';
import 'package:app_movij/templates/widgets/widgets_menu_juego.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_movij/utils/flame_const.dart';

class JuegosTFPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return getListaJuegos(context, 'Terapia Fisica', _btns);
  }

  List<Widget> _btns(BuildContext context) {
    return [
      getBtnJuego('Encuentra', (){
        Navigator.of(context).pushNamed('juego/tf/encuentra');
      }),
      SizedBox(height: 35,),
      getBtnJuego('Sigue', () async {
        // La puntuacion mas alta guardada 
        SharedPreferences store = await SharedPreferences.getInstance();
        GameController gc = new GameController(store);
        FlameConst.TAPPER.onTapDown = gc.onTapDown;
        Navigator.pushNamed(context, 'jugar', arguments: gc.widget);
      }),
      SizedBox(height: 35,),
      getBtnJuego('Camina', () {}),
      SizedBox(height: 35,),
      getBtnJuego('Ordena', () {}),
      SizedBox(height: 35,),
      getBtnJuego('Clasifica', () {
        Navigator.of(context).pushNamed('juego/tf/clasifica');
      }),
      SizedBox(height: 35,),
      getBtnJuego('Otros', () {}),
    ];
  }
  
}