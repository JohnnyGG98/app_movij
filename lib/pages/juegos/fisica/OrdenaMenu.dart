import 'package:app_movij/animated/personaje_preview.dart';
import 'package:app_movij/pages/juegos/fisica/ordena/const_ordena.dart';
import 'package:app_movij/pages/juegos/fisica/ordena/ordena_main.dart';
import 'package:app_movij/templates/btn_juego.dart';
import 'package:app_movij/templates/menu_lateral.dart';
import 'package:app_movij/templates/widgets/widget_informacion_juego.dart';
import 'package:flutter/material.dart';

class MenuOrdenaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordena'),
      ),
      drawer: getDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InformacionJuego(
            'Se debe ordenar el objeto, de dos diferentes formas. De pequeño a grande y de grande a pequeño.\n\nSeleccionar objetos:',
          ),
          _ObjetoOrdena(),
        ],
      ),
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
    return Column(
      children: <Widget>[
        Container(
          height: 150.0,
          child: _menu(),
        ),
        SizedBox(height: 20),
        _imgPath != ''
            ? getPlayButtom(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OrdenaMainPage(_imgPath)));
              })
            : Container(),
        SizedBox(height: 40),
        _imgPath != '' ? PersonaPreview(_imgPath) : Container()
      ],
    );
  }

  Widget _menu() {
    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      children: _getImagenes(),
    );
  }

  List<Widget> _getImagenes() {
    if (_paths == null) {
      _paths = _getPaths();
    }
    List<Widget> widgets = new List();

    for (String path in _paths) {
      widgets.add(getBtnPersonaje(path, () {
        setState(() {
          _imgPath = path;
        });
      }));
      widgets.add(SizedBox(
        width: 40,
      ));
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
    return getBtnPersonaje(path, () {
      setState(() {
        _imgPath = path;
      });
    });
  }
}
