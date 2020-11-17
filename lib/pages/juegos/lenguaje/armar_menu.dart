import 'package:app_movij/pages/juegos/lenguaje/armar/armar_main.dart';
import 'package:app_movij/pages/juegos/lenguaje/armar/cons_armar.dart';
import 'package:app_movij/utils/transitions.dart';
import 'package:app_movij/widgets/game_menu/container_game.dart';
import 'package:app_movij/widgets/game_menu/page_game.dart';
import 'package:app_movij/widgets/game_menu/personaje_game.dart';
import 'package:flutter/material.dart';

class ArmarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageGame(
      title: 'Rompecabezas',
      text: 'Se debe armar las figuras en su forma correcta',
      label: 'Armar rompecabezas',
      child: _ArmarItems(),
    );
  }
}

class _ArmarItems extends StatefulWidget {
  @override
  __ArmarItemsState createState() => __ArmarItemsState();
}

class __ArmarItemsState extends State<_ArmarItems> {
  String label = '';
  String image = '';
  List<Widget> widgets;

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
          child: ArmarMain(image: image),
        ));
      },
      children: widgets,
    );
  }

  List<Widget> getItems() {
    List<Widget> list = [];
    for (ArmarJuego item in opcionesArmar) {
      list.add(PersonajeGame(
        img: item.imgPath,
        onTap: () {
          setState(() {
            label = item.nombre;
            image = item.imgPath;
          });
        },
      ));
      list.add(SizedBox(width: 20));
    }
    return list;
  }
}
