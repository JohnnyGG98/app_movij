import 'package:app_movij/game_ctr.dart';
import 'package:app_movij/models/game_register_model.dart';
import 'package:app_movij/pages/juegos/fisica/ClasificaMenu.dart';
import 'package:app_movij/pages/juegos/fisica/EncuentraMenu.dart';
import 'package:app_movij/pages/juegos/fisica/OrdenaMenu.dart';
import 'package:app_movij/pages/juegos/lenguaje/LamparaPage.dart';
import 'package:app_movij/pages/juegos/lenguaje/TiempoMenu.dart';
import 'package:app_movij/pages/juegos/lenguaje/armar_menu.dart';
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
  Widget child;

  ButtonGameModel({
    @required this.juego,
    @required this.color,
    @required this.animationStart,
    this.page = '',
    this.child,
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
    child: MenuEncuentraPage(),
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
    child: MenuOrdenaPage(),
  ),
  ButtonGameModel(
    color: Colors.red.withOpacity(0.8),
    juego: 'Clasifica',
    page: 'juego/tf/clasifica',
    animationStart: Offset(-40, -40),
    register: GameRegisterModel(),
    child: MenuClasificaPage(),
  ),
];

// Juegos de terapias de lenguaje 

List<ButtonGameModel> buttonsTL = [
  ButtonGameModel(
    color: Colors.blue.withOpacity(0.4),
    juego: 'Tiempo',
    animationStart: Offset(40, 40),
    register: GameRegisterModel(lastPlay: DateTime.now(), totalWins: 0),
    child: MenuTiempoPage(),
  ),
  ButtonGameModel(
    color: Colors.cyan.withOpacity(0.4),
    juego: 'Luz',
    animationStart: Offset(-20, -20),
    register: GameRegisterModel(lastPlay: DateTime.now(), totalWins: 7),
    child: LamparaPage(),
  ),
  ButtonGameModel(
    color: Colors.indigo.withOpacity(0.7),
    juego: 'Hora',
    animationStart: Offset(20, 20),
    register: GameRegisterModel(),
  ),
  ButtonGameModel(
    color: Colors.yellowAccent.withOpacity(0.8),
    juego: 'Cantidad',
    animationStart: Offset(-40, -40),
    register: GameRegisterModel(),
  ),
  ButtonGameModel(
    color: Colors.pinkAccent.withOpacity(0.8),
    juego: 'Pictogramas',
    animationStart: Offset(40, 40),
    register: GameRegisterModel(),
  ),
  ButtonGameModel(
    color: Colors.teal.withOpacity(0.8),
    juego: 'Rompecabezas',
    animationStart: Offset(-20, -20),
    register: GameRegisterModel(),
    child: ArmarMenu(),
  ),
];

