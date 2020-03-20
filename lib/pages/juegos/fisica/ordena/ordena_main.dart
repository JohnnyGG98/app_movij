import 'dart:math';

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

  _updateMyItems(int oldIndex,int newIndex) {
    _seed++;
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    double aux = _tamanos.removeAt(oldIndex);
    _tamanos.insert(newIndex, aux);    
  }

  List<double> _tamanos;

  @override
  Widget build(BuildContext context) {
    if (_tamanos == null) {
      _tamanos = _getTamanos();
    }
    
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
            _tamanos = _getTamanos();
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
                  child: ReorderableListView(
                    children: _tamanos.map((s) => Container(
                      key: ValueKey(_seed + s),
                      height: _SIZECTN,
                      width: double.infinity,
                      child: _getImg(s),
                    )).toList() 
                    ,
  
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        _updateMyItems(oldIndex, newIndex);
                      });
                    },
                    
                  )
                ),
              ],
            )
          )
        ],
      ),
    );
  }

  List<double> _getTamanos() {
    List<double> _tamanos = new List();
    _tamanos.add(_PEQUENA);
    _tamanos.add(_MEDIANA);
    _tamanos.add(_GRANDE);
    _tamanos.add(_SIZECTN);
    return _tamanos..shuffle(Random(_seed));
  }

  Widget _getImg(double tamano) {
    return Center(
      child: Container(
        height: tamano,
        width: tamano,
        child: Image(
          image: AssetImage(widget._img),
          fit: BoxFit.contain,
        ),
      ),
    ); 
  }

}