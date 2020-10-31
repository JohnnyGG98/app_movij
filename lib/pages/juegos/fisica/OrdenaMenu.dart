import 'package:app_movij/pages/juegos/fisica/ordena/const_ordena.dart';
import 'package:app_movij/pages/juegos/fisica/ordena/ordena_main.dart';
import 'package:app_movij/utils/transitions.dart';
import 'package:app_movij/widgets/game_menu/container_game.dart';
import 'package:app_movij/widgets/game_menu/page_game.dart';
import 'package:app_movij/widgets/game_menu/personaje_game.dart';
import 'package:flutter/material.dart';

class MenuOrdenaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageGame(
      title: 'Ordena',
      text:
          'Se debe ordenar el objeto, de dos diferentes formas. De pequeño a grande y de grande a pequeño',
      label: 'Seleccionar objetos:',
      child: _ObjetoOrdena(),
    );
  }
}

class _ObjetoOrdena extends StatefulWidget {
  @override
  __ObjetoOrdenaState createState() => __ObjetoOrdenaState();
}

class __ObjetoOrdenaState extends State<_ObjetoOrdena> {
  String _imgPath = '';
  List<String> _paths;

  @override
  Widget build(BuildContext context) {
    return ContainerGame(
      image: _imgPath,
      callback: () {
        Navigator.of(context).push(DefaultFadeTransition(
          child: OrdenaMainPage(_imgPath),
        ));
      },
      children: _getImagenes(),
    );
  }

  List<Widget> _getImagenes() {
    if (_paths == null) {
      _paths = _getPaths();
    }
    List<Widget> widgets = new List();

    for (String path in _paths) {
      widgets.add(PersonajeGame(
        img: path,
        onTap: () {
          setState(() {
            _imgPath = path;
          });
        },
      ));
      widgets.add(SizedBox(width: 20));
    }

    widgets.add(_getRandomBtn());

    return widgets;
  }

  List<String> _getPaths() {
    List<String> paths = new List();
    String usados = '';
    for (var i = 0; i < 5; i++) {
      String path = getRandomPathOrdena();
      while (!usados.contains(path)) {
        path = getRandomPathOrdena();
        if (!usados.contains(path)) {
          usados += path;
          paths.add(path);
        }
      }
    }
    return paths;
  }

  Widget _getRandomBtn() {
    String path = getRandomPathOrdena();
    return PersonajeGame(
      img: path,
      onTap: () {
        setState(() {
          _imgPath = path;
        });
      },
    );
  }
}
