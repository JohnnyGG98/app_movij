import 'package:app_movij/pages/juegos/fisica/clasifica/clasifica_main.dart';
import 'package:app_movij/utils/transitions.dart';
import 'package:app_movij/widgets/game_menu/container_game.dart';
import 'package:app_movij/widgets/game_menu/page_game.dart';
import 'package:app_movij/widgets/game_menu/personaje_game.dart';
import 'package:flutter/material.dart';

import 'clasifica/const_clasifica.dart';

class MenuClasificaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageGame(
      title: 'Clasifica colores',
      text:
          'Se debe clasificar los objetos, con el color o su categoría correspondiente',
      label: 'Seleccionar categoría:',
      child: _CategoriaClasifica(),
    );
  }
}

class _CategoriaClasifica extends StatefulWidget {
  @override
  __CategoriaClasificaState createState() => __CategoriaClasificaState();
}

class __CategoriaClasificaState extends State<_CategoriaClasifica> {
  final ListaCategoriasClasifica _lc = ListaCategoriasClasifica();

  String _imgPath = '';
  String _nombreCategoria = '';
  List<ClasificaJuego> _categorias;
  String _categoria;

  @override
  Widget build(BuildContext context) {
    return ContainerGame(
      label: _nombreCategoria,
      image: _imgPath,
      callback: () {
        _initJugar(context);
      },
      children: _getCategorias(),
    );
  }

  List<Widget> _getCategorias() {
    if (_categorias == null) {
      _categorias = _lc.getRandomPaths();
    }
    List<Widget> widgets = new List();

    for (var i = 0; i < _categorias.length; i++) {
      widgets.add(PersonajeGame(
        img: _categorias[i].imgPath,
        onTap: () {
          setState(() {
            _imgPath = _categorias[i].imgPath;
            _categoria = _categorias[i].categoria;
            _nombreCategoria = 'Clasificar $_categoria';
          });
        },
      ));
      widgets.add(SizedBox(width: 20));
    }

    ClasificaJuego todos = _lc.getRandomPathAll();

    widgets.add(PersonajeGame(
      img: todos.imgPath,
      onTap: () {
        setState(() {
          _imgPath = todos.imgPath;
          _categoria = 'Todos';
          _nombreCategoria = 'Clasificar $_categoria';
        });
      },
    ));
    return widgets;
  }

  void _initJugar(BuildContext context) {
    switch (_categoria) {
      case 'Frutas':
        _jugar(context, _lc.getFrutas());
        break;
      case 'Verduras':
        _jugar(context, _lc.getVerduras());
        break;
      case 'Transportes':
        _jugar(context, _lc.getTransportes());
        break;
      case 'Balones':
        _jugar(context, _lc.getBalones());
        break;
      default:
        _jugar(context, _lc.getTodos());
        break;
    }
  }

  void _jugar(BuildContext context, List<ClasificaJuego> items) {
    Navigator.of(context).push(
      DefaultFadeTransition(child: ClasificaMainPage(items)),
    );
  }
}
