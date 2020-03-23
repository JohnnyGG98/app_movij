import 'dart:math';

import 'package:app_movij/C/colors.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/personaje_encuentra.dart';
import 'package:app_movij/templates/widgets/widget_victoria.dart';
import 'package:app_movij/utils/speak.dart';
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
  int _gameMode = rand.nextInt(2);
  int _intentos = 1;
  bool _win = false; 
  bool _mostrarVictoria = false; 
  String _orden = '';
  List<double> _tamanos;
  int _numMov = 0; 

  @override
  Widget build(BuildContext context) {
    if (_tamanos == null) {
      _tamanos = _getTamanos();
    }

    if (_intentos == 1 && _numMov == 0) {
      _youWin();
      if (_win ) {
        _newGame();
        _win = false;
      }  
    }

    if (_gameMode == 0) {
      _orden = 'Pequeno a grande';
    } else {
      _orden = 'Grande a pequeno';
    }

    if (_win) {
      _win = false;
      speakNow('Ganaste... Felicidades!');
      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {
          _mostrarVictoria = true; 
        });
      });
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Número movimientos:  $_numMov'),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: _mostrarVictoria ? _newGame : null,
        backgroundColor: _mostrarVictoria ? ACCENT_COLOR : Colors.black45,
      ),

      body: _mostrarVictoria ? VictoriaJuego('Edisson') : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 30.0,
            width: double.infinity,
            child: Center(
              child: Text(_win ? 'YOU WIN' : _orden,
                style: TextStyle(
                  fontSize: 20.0
                ), 
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.0),
          ),

          Expanded(
            child: _game()
          )
        ],
      ),

    );
  }

  void _newGame() {
    setState(() {
      _numMov = 0;
      _mostrarVictoria = false;
      _seed++;
      _intentos++;
      _tamanos = _getTamanos();
      _gameMode = rand.nextInt(2);
    });
  }

  Widget _game() {
    return ReorderableListView(
      children: _tamanos.map((s) => Container(
        key: ValueKey(_seed + s),
        height: _SIZECTN,
        width: double.infinity,
        child: _getImg(s),
      )).toList(),
      onReorder: (oldIndex, newIndex) {
        setState(() {
          _updateMyItems(oldIndex, newIndex);
        });
      },
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

  _updateMyItems(int oldIndex,int newIndex) {
    _seed++;
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    double aux = _tamanos.removeAt(oldIndex);
    _tamanos.insert(newIndex, aux);    
    _youWin();
    _numMov++; 
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

}