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
  int _gameMode = rand.nextInt(1);
  int _intentos = 1;
  bool _win = false; 
  String _orden = '';

  _updateMyItems(int oldIndex,int newIndex) {
    _seed++;
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    double aux = _tamanos.removeAt(oldIndex);
    _tamanos.insert(newIndex, aux);    
    _youWin();
  }

  void _youWin() {
    List<double> ordenados = List.of(_tamanos);
    if (_gameMode == 0) {
      ordenados.sort();
    } else {
      ordenados.sort((a, b) => b.compareTo(a));
    }
    
    _win = true; 
    for (var i = 0; i < ordenados.length; i++) {
      if (_tamanos[i] != ordenados[i]) {
        _win = false;
        break; 
      }
    }
  }

  List<double> _tamanos;

  @override
  Widget build(BuildContext context) {
    if (_tamanos == null) {
      _tamanos = _getTamanos();
    }

    if (_gameMode == 0) {
      _orden = 'Pequeno a grande';
    } else {
      _orden = 'Grande a pequeno';
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordena | Intentos: $_intentos'),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          setState(() {
            _win = false; 
            _seed++;
            _intentos++;
            _tamanos = _getTamanos();
            _gameMode = rand.nextInt(2);
          });
        }
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50.0,
            width: double.infinity,
            child: Center(
              child: Text(_win ? 'YOU WIN' : _orden,
                style: TextStyle(
                  fontSize: 20.0
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