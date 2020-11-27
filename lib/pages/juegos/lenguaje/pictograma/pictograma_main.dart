import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/export_encuentra.dart';
import 'package:app_movij/pages/juegos/lenguaje/pictograma/cons_pictograma.dart';
import 'package:app_movij/widgets/game/win_game_page.dart';
import 'package:flutter/material.dart';

class PictogramaMain extends StatefulWidget {
  final PictogramaJuego model;

  const PictogramaMain({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  _PictogramaMainState createState() => _PictogramaMainState();
}

class _PictogramaMainState extends State<PictogramaMain> {
  String complete = '';
  Map<int, String> hidden = {};
  int selected;

  @override
  void initState() {
    super.initState();
    final String nombre = widget.model.nombre;
    final int maxHidden = rand.nextInt(nombre.length ~/ 3) + nombre.length ~/ 2;
    int numHidden = 0;
    for (int i = 0; i < nombre.length; i++) {
      final h = rand.nextInt(nombre.length);
      if ((h % 2 == 0 && numHidden <= maxHidden)) {
        hidden[i] = '';
        complete += nombre[i];
        numHidden++;
      } else {
        hidden[i] = nombre[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completa la palabra'),
      ),
      body: complete.length == 0
          ? WinGamePage(
              tapNewGame: () {
                Navigator.pop(context);
              },
            )
          : Column(
              children: [
                Expanded(
                  child: Container(
                    child: Image(
                      image: AssetImage(widget.model.imgPath),
                    ),
                  ),
                ),
                _getWord(),
                _getWords(),
              ],
            ),
    );
  }

  Widget _getWord() {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int i) {
          return GestureDetector(
            onTap: () {
              // Si es null no comprobamos
              if (selected == null) return;

              if (widget.model.nombre[i] == complete[selected]) {
                hidden[i] = complete[selected];
                String newComplete = '';
                for (int w = 0; w < complete.length; w++) {
                  if (w != selected) {
                    newComplete += complete[w];
                  }
                }
                Flame.audio.play('correct.wav');
                setState(() {
                  complete = newComplete;
                  selected = null;
                });
              } else {
                Flame.audio.play('incorrect.ogg');
              }
            },
            child: Container(
              child: Center(
                child: Text(
                  hidden[i],
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: (selected != null && hidden[i] == '')
                    ? AppThemeColors.BLUE_DARK
                    : Colors.white,
              ),
              width: 80,
            ),
          );
        },
        itemCount: hidden.length,
      ),
    );
  }

  Widget _getWords() {
    return Material(
      elevation: 2,
      child: Container(
        height: 120,
        width: double.infinity,
        color: AppThemeColors.WHITE_SHADOW.withOpacity(0.6),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          itemBuilder: (BuildContext context, int i) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (selected == i) {
                    selected = null;
                  } else {
                    selected = i;
                  }
                });
              },
              child: Container(
                child: Center(
                  child: Text(
                    complete[i],
                    style: TextStyle(
                      fontSize: 30,
                      color: (selected != null && selected == i)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: (selected != null && selected == i)
                      ? AppThemeColors.GREEN
                      : AppThemeColors.WHITE_SHADOW,
                  border: Border.all(
                    color: (selected != null && selected == i)
                        ? AppThemeColors.GREEN
                        : Colors.black,
                  ),
                ),
                width: 80,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int i) {
            return SizedBox(width: 20);
          },
          itemCount: complete.length,
        ),
      ),
    );
  }
}
