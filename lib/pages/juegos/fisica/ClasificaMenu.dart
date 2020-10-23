import 'package:app_movij/animated/personaje_preview.dart';
import 'package:app_movij/pages/juegos/fisica/clasifica/clasifica_main.dart';
import 'package:app_movij/templates/btn_juego.dart';
import 'package:app_movij/templates/menu_lateral.dart';
import 'package:app_movij/templates/widgets/widget_informacion_juego.dart';
import 'package:flutter/material.dart';

import 'clasifica/const_clasifica.dart';

class MenuClasificaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clasifica'),
      ),
      drawer: MenuLateral(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InformacionJuego(
            'Se debe clasificar los objetos, con el color o su categoría correspondiente.\n\nSeleccionar categoría:',
          ),
          _CategoriaClasifica(),
        ],
      ),
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
    return Column(
      children: <Widget>[
        Container(
          height: 150.0,
          child: _menu(),
        ),
        SizedBox(height: 20),
        _imgPath != '' && _categoria != ''
            ? getPlayButtom(() {
                _initJugar(context);
              })
            : Container(),
        SizedBox(height: 20),
        _nombreCategoria != '' ? Text(_nombreCategoria) : Container(),
        SizedBox(height: 40),
        _imgPath != '' ? PersonaPreview(_imgPath) : Container(),
      ],
    );
  }

  Widget _menu() {
    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      children: _getCategorias(),
    );
  }

  List<Widget> _getCategorias() {
    if (_categorias == null) {
      _categorias = _lc.getRandomPaths();
    }
    List<Widget> widgets = new List();

    for (var i = 0; i < _categorias.length; i++) {
      widgets.add(getBtnPersonaje(_categorias[i].imgPath, () {
        setState(() {
          _imgPath = _categorias[i].imgPath;
          _categoria = _categorias[i].categoria;
          _nombreCategoria = 'Clasificar $_categoria';
        });
      }));
      widgets.add(SizedBox(width: 40));
    }

    ClasificaJuego todos = _lc.getRandomPathAll();

    widgets.add(getBtnPersonaje(todos.imgPath, () {
      setState(() {
        _imgPath = todos.imgPath;
        _categoria = 'Todos';
        _nombreCategoria = 'Clasificar $_categoria';
      });
    }));
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
      MaterialPageRoute(builder: (context) => ClasificaMainPage(items)),
    );
  }
}
