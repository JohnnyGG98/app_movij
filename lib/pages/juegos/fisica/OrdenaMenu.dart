import 'package:app_movij/templates/menu_lateral.dart';
import 'package:app_movij/templates/widgets/widget_informacion_juego.dart';
import 'package:flutter/material.dart';

class MenuOrdena extends StatelessWidget {
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
          InformacionJuego('Se debe ordenar el objeto, de dos diferentes maneras. De mayor al menor y del menor al mayor.\n\nSeleccionar objetos:'),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}