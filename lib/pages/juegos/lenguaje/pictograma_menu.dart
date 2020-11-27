import 'package:app_movij/pages/juegos/lenguaje/pictograma/cons_pictograma.dart';
import 'package:app_movij/pages/juegos/lenguaje/pictograma/pictograma_main.dart';
import 'package:app_movij/utils/transitions.dart';
import 'package:app_movij/widgets/game_menu/container_game.dart';
import 'package:app_movij/widgets/game_menu/page_game.dart';
import 'package:app_movij/widgets/game_menu/personaje_game.dart';
import 'package:flutter/material.dart';

class PictogramaMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageGame(
      title: 'Pictogramas',
      text: 'Completar la palabra',
      label: 'Pictogramas',
      child: _PictogramaItems(),
    );
  }
}

class _PictogramaItems extends StatefulWidget {
  @override
  __PictogramaItemsState createState() => __PictogramaItemsState();
}

class __PictogramaItemsState extends State<_PictogramaItems> {
  String label = '';
  String image = '';
  List<Widget> widgets;
  PictogramaJuego model;

  @override
  void initState() {
    super.initState();
    widgets = getItems();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerGame(
      label: label,
      image: image,
      callback: () {
        Navigator.of(context).push(DefaultFadeTransition(
          child: PictogramaMain(model: model),
        ));
      },
      children: widgets,
    );
  }

  List<Widget> getItems() {
    List<Widget> list = [];
    for (PictogramaJuego item in opcionesPictograma) {
      list.add(PersonajeGame(
        img: item.imgPath,
        onTap: () {
          setState(() {
            label = item.nombre;
            image = item.imgPath;
            model = item;
          });
        },
      ));
      list.add(SizedBox(width: 20));
    }
    return list;
  }
}
