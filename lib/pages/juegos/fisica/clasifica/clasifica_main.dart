import 'dart:math';

import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/helpers/Helpers.dart';
import 'package:app_movij/pages/juegos/fisica/clasifica/const_clasifica.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/personaje_encuentra.dart';
import 'package:app_movij/templates/widgets/widget_victoria.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class ClasificaMainPage extends StatefulWidget {
  final List<ClasificaJuego> items;

  ClasificaMainPage(this.items);

  @override
  _ClasificaMainPageState createState() => _ClasificaMainPageState();
}

class _ClasificaMainPageState extends State<ClasificaMainPage> {
  final Map<String, bool> _score = {};
  final Map<String, ClasificaJuego> _choices = {};
  List<_ColorOption> _colors = [];
  bool _mostrarVictoria = false;

  // Para crear la lista random
  int _seed = rand.nextInt(10);
  // Para el feedback al jugador
  String _feedback = AppThemeImages.pathIconHappy;

  @override
  Widget build(BuildContext context) {
    if (_score.length > 0 &&
        _score.length == _choices.length &&
        !_mostrarVictoria) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          _mostrarVictoria = true;
        });
      });
    } else {
      _setChoices();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Puntuación ${_score.length} / ${widget.items.length}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            _mostrarVictoria = false;
            _score.clear();
            _seed++;
            _colors..shuffle(Random(_seed));
          });
        },
      ),
      body: _mostrarVictoria ? VictoriaJuego('Alexander') : _game(),
    );
  }

  void _setChoices() {
    if (_choices.length > 0) return;
    String agregados = '';
    widget.items.forEach((i) {
      _choices.addAll({i.imgPath: i});
      // Si no agregamos ya el color
      if (!agregados.contains(i.colorName)) {
        agregados += i.colorName;
        _colors.add(new _ColorOption(
          color: i.color,
          name: i.colorName,
        ));
      }
    });

    _colors = _colors.toSet().toList();
    _colors..shuffle(Random(_seed));
  }

  Widget _game() {
    return Column(
      children: <Widget>[
        Material(
          elevation: 2,
          child: Container(
            height: 175.0,
            width: double.infinity,
            color: AppThemeColors.WHITE_SHADOW.withOpacity(0.6),
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: 40,
              ),
              children: _choices.values.map(
                (img) {
                  return Draggable<ClasificaJuego>(
                    data: img,
                    child: _score[img.imgPath] == true
                        ? Container()
                        : _ImagenDrag(
                            _score[img.imgPath] == true
                                ? AppThemeImages.pathIconHappy
                                : img.imgPath,
                          ),
                    feedback: _ImagenDrag(img.imgPath),
                    childWhenDragging: _ImagenDrag(_feedback),
                    onDragStarted: () {
                      _feedback = AppThemeImages.pathIconHappy;
                    },
                  );
                },
              ).toList()
                ..shuffle(Random(_seed)),
            ),
          ),
        ),
        SizedBox(height: 25),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppThemeColors.WHITE_SHADOW,
                  spreadRadius: 2.5,
                  blurRadius: 2,
                  offset: Offset(0, -1),
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                Text(
                  'Clasificar por el color',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(
                      bottom: 25,
                      left: 15,
                      right: 15,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1,
                    ),
                    physics: BouncingScrollPhysics(),
                    itemCount: _colors.length,
                    itemBuilder: (BuildContext context, int i) {
                      return _tarjet(_colors[i]);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  DragTarget _tarjet(_ColorOption item) {
    return DragTarget<ClasificaJuego>(
      builder: (
        BuildContext context,
        List<ClasificaJuego> incoming,
        List rejected,
      ) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(20),
                border: item.name == 'blanco' ? Border.all() : null,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: item.name == 'blanco' ? Border.all() : null,
                ),
                child: IconButton(
                  color: AppThemeColors.BLUE,
                  icon: Icon(Icons.volume_up_rounded),
                  onPressed: () {
                    Helpers.speak(item.name);
                  },
                ),
              ),
            ),
          ],
        );
      },
      onWillAccept: (data) {
        bool accept = data.color == item.color;
        if (accept) {
          _feedback = AppThemeImages.pathIconSmile;
        } else {
          _feedback = AppThemeImages.pathIconSad;
        }
        setState(() {});
        return accept;
      },
      onAccept: (data) async {
        await Flame.audio.play('correct.wav');
        setState(() {
          _score[data.imgPath] = true;
        });
      },
      onLeave: (data) {
        setState(() {
          _feedback = AppThemeImages.pathIconHappy;
        });
      },
    );
  }
}

class _ImagenDrag extends StatelessWidget {
  final String img;

  _ImagenDrag(this.img);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        child: Image(
          image: AssetImage(img),
          fit: BoxFit.contain,
        ),
        margin: EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }
}

class _ColorOption {
  Color color;
  String name;

  _ColorOption({
    this.color,
    this.name,
  });
}
