import 'package:app_movij/pages/juegos/fisica/encuentra/encuentra_main.dart';
import 'package:app_movij/pages/juegos/game_container.dart';
import 'package:app_movij/utils/transitions.dart';
import 'package:app_movij/widgets/game_menu/container_game.dart';
import 'package:app_movij/widgets/game_menu/page_game.dart';
import 'package:app_movij/widgets/game_menu/personaje_game.dart';
import 'package:flutter/material.dart';

class MenuEncuentraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageGame(
      title: 'Encuentra',
      text:
          'Se debe buscar únicamente al personaje que se seleccione, el número de veces que se indica',
      label: 'Seleccionar personaje:',
      child: _PersonasEncuentra(),
    );
  }
}

class _PersonasEncuentra extends StatefulWidget {
  @override
  __PersonasEncuentraState createState() => __PersonasEncuentraState();
}

class __PersonasEncuentraState extends State<_PersonasEncuentra> {
  String _imgPath = '';
  String _nombrePersonaje = '';

  @override
  Widget build(BuildContext context) {
    return ContainerGame(
      image: _imgPath,
      callback: () {
        EncuentraMain em = new EncuentraMain(context, _nombrePersonaje);
        Navigator.push(context, DefaultFadeTransition(child: GameContainer(widget: em.widget)));
      },
      children: _list(),
    );
  }

  List<Widget> _list() {
    return [
      PersonajeGame(
        img: 'assets/games/tf/Nave.png',
        onTap: () {
          setState(() {
            _nombrePersonaje = 'Nave.png';
            _imgPath = 'assets/games/tf/Nave.png';
          });
        },
      ),
      SizedBox(width: 20),
      PersonajeGame(
        img: 'assets/games/tf/Barco.png',
        onTap: () {
          setState(() {
            _nombrePersonaje = 'Barco.png';
            _imgPath = 'assets/games/tf/Barco.png';
          });
        },
      ),
      SizedBox(width: 20),
      PersonajeGame(
        img: 'assets/games/tf/SoccerBall.png',
        onTap: () {
          setState(() {
            _nombrePersonaje = 'balon.png';
            _imgPath = 'assets/games/tf/SoccerBall.png';
          });
        },
      ),
    ];
  }
}
