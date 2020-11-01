import 'dart:math';

import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/personaje_encuentra.dart';
import 'package:app_movij/templates/widgets/widget_victoria.dart';
import 'package:flame/flame.dart';
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
// TODO: Cambiar a un matamo dinamico dependiendo del size del dispositivo
const double _SIZECTN = 175;

class _OrdenaMainPageState extends State<OrdenaMainPage> {
  int _seed = rand.nextInt(10);
  int _gameMode = rand.nextInt(2);
  int _intentos = 1;
  bool _win = false;
  bool _mostrarVictoria = false;
  String _orden = '';
  List<double> _tamanos;
  List<double> ordenados;
  int _numMov = 0;

  @override
  Widget build(BuildContext context) {
    if (_tamanos == null) {
      _tamanos = _getTamanos();
      ordenados = getOrdenados();
    }

    if (_intentos == 1 && _numMov == 0) {
      validarGame();
    }

    if (_gameMode == 0) {
      _orden = 'Pequeño a grande';
    } else {
      _orden = 'Grande a pequeño';
    }

    if (_win) {
      _win = false;
      // speakNow('Ganaste... Felicidades!');
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          _mostrarVictoria = true;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$_orden # $_numMov'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: _mostrarVictoria ? _newGame : null,
        backgroundColor: _mostrarVictoria
            ? AppThemeColors.GREEN
            : AppThemeColors.WHITE_SHADOW,
      ),
      body: _mostrarVictoria ? VictoriaJuego('Edisson') : _game(),
    );
  }

  void _newGame() {
    if (_win) {
      validarGame();
    } else {
      setState(() {
        _numMov = 0;
        _mostrarVictoria = false;
        _seed++;
        _intentos++;
        _tamanos = _getTamanos();
        ordenados = getOrdenados();
        _gameMode = rand.nextInt(2);
      });
    }
  }

  Widget _game() {
    return Stack(
      children: [
        listReordenable(),
        Positioned(
          right: 20,
          top: 20,
          child: resultExample(),
        ),
      ],
    );
  }

  Widget resultExample() {
    return Container(
      width: 75,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppThemeColors.WHITE_SHADOW,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: ordenados.map(
          (s) {
            final Widget img = Container(
              height: 75,
              child: _getImg(s * 0.25),
            );
            final int index = ordenados.indexOf(s);
            final bool isSelected = _tamanos[index] == s;
            if (isSelected) {
              Flame.audio.play('correct.wav');
              return Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 10,
                    right: 10,
                    bottom: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppThemeColors.GREEN.withOpacity(0.85),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  img,
                ],
              );
            }
            return img;
          },
        ).toList(),
      ),
    );
  }

  Widget listReordenable() {
    return ReorderableListView(
      padding: EdgeInsets.zero,
      children: _tamanos
          .map((s) => Container(
                key: ValueKey(_seed + s),
                height: _SIZECTN,
                width: double.infinity,
                child: _getImg(s),
              ))
          .toList(),
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
        child: Image(
          image: AssetImage(widget._img),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  _updateMyItems(int oldIndex, int newIndex) {
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
    _win = true;
    for (var i = 0; i < ordenados.length; i++) {
      if (_tamanos[i] != ordenados[i]) {
        _win = false;
        break;
      }
    }
  }

  void validarGame() {
    _youWin();
    if (_win) {
      _win = false;
      _newGame();
    }
  }

  List<double> getOrdenados() {
    List<double> ordenados = List.of(_tamanos);
    if (_gameMode == 0) {
      ordenados.sort();
    } else {
      ordenados.sort((a, b) => b.compareTo(a));
    }
    return ordenados;
  }
}
