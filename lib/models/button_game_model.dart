import 'package:app_movij/game_ctr.dart';
import 'package:app_movij/models/game_register_model.dart';
import 'package:app_movij/utils/transitions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonGameModel {
  String juego;
  Color color;
  String page;
  Offset animationStart;
  Function(BuildContext context) onTap;
  GameRegisterModel register;

  ButtonGameModel({
    @required this.juego,
    @required this.color,
    @required this.page,
    @required this.animationStart,
    this.onTap,
    this.register,
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
    animationStart: Offset(40, 40),
    register: GameRegisterModel(lastPlay: DateTime.now(), totalWins: 1),
  ),
  ButtonGameModel(
    color: Colors.orange.withOpacity(0.4),
    juego: 'Sigue',
    page: '',
    animationStart: Offset(-20, -20),
    onTap: (BuildContext context) async {
      // La puntuacion mas alta guardada
      SharedPreferences store = await SharedPreferences.getInstance();
      GameController gc = new GameController(store);
      Navigator.push(context, DefaultFadeTransition(child: gc.widget));
    },
    register: GameRegisterModel(lastPlay: DateTime.now(), totalWins: 2),
  ),
  ButtonGameModel(
    color: Colors.green.withOpacity(0.7),
    juego: 'Ordena',
    page: 'juego/tf/ordena',
    animationStart: Offset(20, 20),
    register: GameRegisterModel(lastPlay: DateTime.now(), totalWins: 3),
  ),
  ButtonGameModel(
    color: Colors.red.withOpacity(0.8),
    juego: 'Clasifica',
    page: 'juego/tf/clasifica',
    animationStart: Offset(-40, -40),
    register: GameRegisterModel(),
  ),
];
