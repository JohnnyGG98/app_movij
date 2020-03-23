import 'dart:math';

import 'package:app_movij/C/colors.dart';
import 'package:app_movij/pages/juegos/fisica/clasifica/const_clasifica.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/personaje_encuentra.dart';
import 'package:app_movij/templates/widgets/widget_victoria.dart';
import 'package:app_movij/utils/speak.dart';
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
  List<Color> _colors = [];
  bool _mostrarVictoria = false; 

  // Para crear la lista random 
  int _seed = rand.nextInt(10);
  // Para el feedback al jugador  
  String _feedback = 'assets/images/emoticon/emoticon-happy.png';

  @override
  Widget build(BuildContext context) {
    
    if (_score.length > 0 && _score.length == _choices.length && !_mostrarVictoria) {
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
        }
      ),

      body: _mostrarVictoria ? VictoriaJuego('Alexander') : Column(
        children: <Widget>[
          Container(
            height: 175.0,
            width: double.infinity,
            child: _score.length == _choices.length ? 
            Center(
              child: Text('FELICIDADES',
                style: TextStyle(
                  fontSize: 30.0
                ),
              ),
            ) :
            ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: _choices.values.map((img) {
                return Draggable<ClasificaJuego>(
                  data: img,
                  child: _score[img.imgPath] == true ? 
                  Container() :
                   _ImagenDrag(
                    _score[img.imgPath] == true ? 'assets/images/emoticon/emoticon-happy.png' : img.imgPath, 
                  ),
                  feedback: _ImagenDrag(img.imgPath),
                  childWhenDragging: _ImagenDrag(_feedback),
                  onDragStarted: (){
                    _feedback = 'assets/images/emoticon/emoticon-happy.png';
                  },

                );
              }).toList()
                ..shuffle(Random(_seed))
            )
          ),
          SizedBox(height: 15.0,),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40)
                )
              ),
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15,),

                  Text('Clasificar por el color',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1
                      ),
                      itemCount: _colors.length,
                      itemBuilder: (BuildContext context, int i){
                        return _tarjet(_colors[i]);
                      },
                    )
                  )

                ],
              )
            ),
          )
        ], 
      ) 
    
    );
  }

  void _setChoices() {
    if (_choices.length > 0) return;
    widget.items.forEach((i) {
      _choices.addAll({
        i.imgPath: i
      });

      _colors.add(i.color);
    });

    _colors = _colors.toSet().toList();
    _colors..shuffle(Random(_seed));
  }

  Widget _tarjet(Color color) {
    return DragTarget<ClasificaJuego>(
      builder: (BuildContext context, List<ClasificaJuego> incoming, List rejected) {
        return Container(
          height: 75,
          width: 150,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              width: 2.0,
              color: Colors.white54
            )
          ),
        );
      },

      onWillAccept: (data) {
        bool accept = data.color == color;
        if (accept) {
          _feedback = 'assets/images/emoticon/emoticon-smile.png';
        } else {
          _feedback = 'assets/images/emoticon/emoticon-sad.png';
        }
        setState(() {
          
        });
        return accept;
      },
      onAccept: (data) {
        setState(() {
          _score[data.imgPath] = true;
          speakNow(data.colorName);
        });
      },

      onLeave: (data) {
        setState(() {
          _feedback = 'assets/images/emoticon/emoticon-happy.png';
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
        height: 75,
        width: 75,
        child: Image(
          image: AssetImage(img),
          fit: BoxFit.contain,
        ),
        margin: EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }
}