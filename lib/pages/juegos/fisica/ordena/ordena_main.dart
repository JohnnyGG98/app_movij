import 'dart:math';

import 'package:app_movij/C/colors.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/personaje_encuentra.dart';
import 'package:flutter/material.dart';

class OrdenaMainPage extends StatefulWidget {

  final String _img;

  OrdenaMainPage(this._img);

  @override
  _OrdenaMainPageState createState() => _OrdenaMainPageState();
}

// Constantes de tamaños 
const double _GRANDE = 150;
const double _MEDIANA = 125;
const double _PEQUENA = 100;
const double _SIZECTN = 175;

class _OrdenaMainPageState extends State<OrdenaMainPage> {


  int _seed = rand.nextInt(10);
  int _intentos = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordena | Intentos: $_intentos'),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            _seed++;
            _intentos++;
          });
        }
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 75.0,
            width: double.infinity,
            child: Center(
              child: Text('PEQUEÑO A GRANDE',
                style: TextStyle(
                  fontSize: 30.0
                ), 
              ),
            ),
          ),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: _getOrdenar(),
                  )
                ),
                Expanded(
                  child: ListView(
                    children: _getOrdenar(),
                  )
                ),
              ],
            )
          )
        ],
      ),
    );
  }

  List<Widget> _getOrdenar() {
    _seed++;
    List<Widget> widgets = new List(); 

    widgets.add(
      Container(
        height: _SIZECTN,
        width: double.infinity,
        child: Center(
          child: Container(
            height: _PEQUENA,
            width: _PEQUENA,
            child: Image(
              image: AssetImage(widget._img),
              fit: BoxFit.contain,
            ),
          ),
        ),
      )
    );

    widgets.add(
      Container(
        height: _SIZECTN,
        width: double.infinity,
        child: Center(
          child: Container(
            height: _MEDIANA,
            width: _MEDIANA,
            child: Image(
              image: AssetImage(widget._img),
              fit: BoxFit.contain,
            ),
          ),
        ),
      )
    );

    widgets.add(
      Container(
        height: _SIZECTN,
        width: double.infinity,
        child: Center(
          child: Container(
            height: _GRANDE,
            width: _GRANDE,
            child: Image(
              image: AssetImage(widget._img),
              fit: BoxFit.contain,
            ),
          ),
        ),
      )
    );

    return widgets..shuffle(Random(_seed));
  }

}