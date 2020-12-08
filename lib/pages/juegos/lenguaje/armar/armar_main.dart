import 'dart:math';

import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/export_encuentra.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/personaje_encuentra.dart';
import 'package:app_movij/widgets/game/armar/pieze.dart';
import 'package:app_movij/widgets/game/win_game_page.dart';
import 'package:flutter/material.dart';

class ArmarMain extends StatefulWidget {
  final String image;

  const ArmarMain({
    Key key,
    @required this.image,
  }) : super(key: key);

  @override
  _ArmarMainState createState() => _ArmarMainState();
}

class _ArmarMainState extends State<ArmarMain> {
  List<_RompecabezaGame> widgets;
  List<Widget> cols = [];
  Image image;
  final Size size = new Size(2000, 2000);
  // final Size size = new Size(100, 100);
  int gameMode = 3;
  Size screenSize;
  double containerSize;
  int seed = rand.nextInt(10);
  final Map<String, bool> score = {};

  @override
  void initState() {
    super.initState();
    image = image = Image(
      image: AssetImage(widget.image),
      fit: BoxFit.cover,
    );
    gameMode = getRandomGame();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    containerSize = (screenSize.width / gameMode) - 20;
    // Si no tenemos widgets
    if (widgets == null) getPiezes();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rompecabezas ${score.length}/${gameMode * gameMode}',
        ),
      ),
      body: score.length == (gameMode * gameMode)
          ? WinGamePage(
              tapNewGame: () {
                Navigator.pop(context);
              },
            )
          : Column(
              children: [
                Expanded(child: getContainer()),
                _piezes(),
              ],
            ),
    );
  }

  int getRandomGame() {
    int mode = rand.nextInt(5);
    mode = (mode > 1) ? mode : (mode + 1);
    return (mode == 1) ? mode + 1 : mode;
  }

  Widget _piezes() {
    if (widgets == null) return Container();
    return Material(
      elevation: 2,
      child: Container(
        height: 200,
        width: double.infinity,
        color: AppThemeColors.WHITE_SHADOW.withOpacity(0.6),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15,
            bottom: 80,
          ),
          itemBuilder: (BuildContext context, int i) {
            _RompecabezaGame rc = widgets[i];
            return Draggable<_RompecabezaGame>(
              data: rc,
              child: score[rc.id] == true ? Container() : rc.child,
              feedback: Container(
                color: AppThemeColors.WHITE_SHADOW,
                child: rc.child,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int i) {
            _RompecabezaGame rc = widgets[i];
            return score[rc.id] == true ? Container() : SizedBox(width: 20);
          },
          itemCount: widgets.length,
        ),
      ),
    );
  }

  Widget getContainer() {
    if (widgets == null) return Container();
    return Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.all(20),
            width: containerSize * gameMode,
            height: containerSize * gameMode,
            child: image,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: cols,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void getPiezes() {
    score.clear();
    // Init values
    cols.clear();
    List<_RompecabezaGame> list = [];

    Widget hide = Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: AppThemeColors.BLUE,
        border: Border.all(
          color: AppThemeColors.WHITE,
        ),
      ),
    );

    Widget show = Container(
      width: containerSize,
      height: containerSize,
    );

    for (int x = 0; x < gameMode; x++) {
      List<Widget> rows = [];
      for (int y = 0; y < gameMode; y++) {
        _RompecabezaGame rc = _RompecabezaGame(
          id: "$x$y",
          child: Pieze(
            image: image,
            imageSize: size,
            row: x,
            col: y,
            max: gameMode,
          ),
        );

        list.add(rc);
        rows.add(
          DragTarget<_RompecabezaGame>(
            builder: (
              BuildContext context,
              List<_RompecabezaGame> incoming,
              List reject,
            ) {
              if (score[rc.id] == true || incoming.length > 0) {
                return show;
              }
              return hide;
            },
            onWillAccept: (data) {
              return data.id == rc.id;
            },
            onAccept: (data) {
              Flame.audio.play('correct.wav');
              setState(() {
                score[data.id] = true;
              });
            },
          ),
        );
      }
      cols.add(Row(children: rows));
    }
    setState(() {
      widgets = list..shuffle(Random(seed));
    });
  }
}

class _RompecabezaGame {
  String id;
  Widget child;
  _RompecabezaGame({
    @required this.id,
    @required this.child,
  });
}
