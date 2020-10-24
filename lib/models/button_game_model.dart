import 'package:app_movij/game_ctr.dart';
import 'package:app_movij/utils/flame_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonGameModel {
  String juego;
  Color color;
  String page;
  Function(BuildContext context) onTap;

  ButtonGameModel({
    @required this.juego,
    @required this.color,
    @required this.page,
    this.onTap,
  });

  /// Devolvemos si el button tiene ruta
  /// Si no tiene ruta se debe usar una funcion
  get haveRoute {
    return page != '';
  }
}

// Listado de juegos

List<ButtonGameModel> buttonsTF = [
  ButtonGameModel(
    color: Colors.red.withOpacity(0.4),
    juego: 'Encuentra',
    page: 'juego/tf/encuentra',
  ),
  ButtonGameModel(
    color: Colors.orange.withOpacity(0.4),
    juego: 'Sigue',
    page: '',
    onTap: (BuildContext context) async {
      // La puntuacion mas alta guardada
        SharedPreferences store = await SharedPreferences.getInstance();
        GameController gc = new GameController(store);
        FlameConst.tapper.onTapDown = gc.onTapDown;
        Navigator.pushNamed(context, 'jugar', arguments: gc.widget);
    }
  ),
  ButtonGameModel(
    color: Colors.green.withOpacity(0.7),
    juego: 'Ordena',
    page: 'juego/tf/ordena',
  ),
  ButtonGameModel(
    color: Colors.red.withOpacity(0.8),
    juego: 'Clasifica',
    page: 'juego/tf/clasifica',
  ),
];
