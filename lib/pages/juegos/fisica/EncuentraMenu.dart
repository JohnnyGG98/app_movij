import 'package:app_movij/animated/personaje_preview.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/encuentra_main.dart';
import 'package:app_movij/templates/btn_juego.dart';
import 'package:app_movij/templates/menu_lateral.dart';
import 'package:app_movij/templates/widgets/widget_informacion_juego.dart';
import 'package:app_movij/utils/flame_const.dart';
import 'package:flutter/material.dart';

class MenuEncuentraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Encuentra'),
        ),
        drawer: MenuLateral(),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InformacionJuego(
                'Se debe buscar únicamente al personaje que se seleccione, el número de veces que se indica.\n\nSeleccionar personaje:'),
            _PersonasEncuentra()
          ],
        ));
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
    return Column(
      children: <Widget>[
        Container(
          height: 150.0,
          child: _menu(),
        ),
        SizedBox(height: 20),
        _imgPath != ''
            ? getPlayButtom(() {
                EncuentraMain em = new EncuentraMain(context, _nombrePersonaje);
                FlameConst.tapper.onTapDown = em.onTapDowm;
                Navigator.pushNamed(context, 'jugar', arguments: em.widget);
              })
            : Container(),
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
      children: <Widget>[
        getBtnPersonaje('assets/games/tf/Nave.png', () {
          setState(() {
            _nombrePersonaje = 'Nave.png';
            _imgPath = 'assets/games/tf/Nave.png';
          });
        }),
        SizedBox(width: 40),
        getBtnPersonaje('assets/games/tf/Barco.png', () {
          setState(() {
            _nombrePersonaje = 'Barco.png';
            _imgPath = 'assets/games/tf/Barco.png';
          });
        }),
        SizedBox(width: 40),
        getBtnPersonaje('assets/games/tf/SoccerBall.png', () {
          setState(() {
            _nombrePersonaje = 'balon.png';
            _imgPath = 'assets/games/tf/SoccerBall.png';
          });
        }),
      ],
    );
  }
}
