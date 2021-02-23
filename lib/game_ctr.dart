import 'dart:math';
import 'dart:ui';

import 'package:app_movij/widgets/game/export_game.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/player.dart';
import 'components/enemy.dart';
import 'components/healt_bar.dart';
import 'components/score_text.dart';
import 'enemy_spawner.dart';

class GameController extends Game with HasWidgetsOverlay, TapDetector {
  // Para obtener el score guardado
  final SharedPreferences store;
  // Para generar numeros random
  final Random rand = Random();
  // Tamaño de la pantalla
  Size screenSize;
  double tileSize;
  // Jugador
  Player player;
  // Enemigos
  EnemySpawner enemySpawner;
  List<Enemy> enemies;
  // Barra de vida
  HealtBar barra;
  // Puntuacion
  int score = 0;
  ScoreText scoreText;
  // Estados
  StateGame state;
  final BuildContext context;

  GameController(this.context, this.store) {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    player = Player(this);
    score = 0;
    state = StateGame.menu;
    enemies = List();
    barra = HealtBar(this);
    enemySpawner = EnemySpawner(this);
    scoreText = ScoreText(this);
  }

  @override
  void render(Canvas c) {
    Rect backgroud = Rect.fromLTWH(
      0,
      0,
      screenSize.width,
      screenSize.height,
    );

    Paint backPaint = Paint()..color = Color(0xFF040120);
    c.drawRect(backgroud, backPaint);
    player.render(c);

    if (state == StateGame.menu) {
      int maxScore = store.getInt('maxscore') ?? 0;
      addWidgetOverlay(
        'menu',
        PauseGame(
          info: 'Puntuación máxima ${maxScore.toString()}',
          tapContinue: () {
            state = StateGame.playing;
            removeWidgetOverlay('menu');
          },
          tapClose: () {
            super.onDetach();
            Navigator.pop(context);
          },
        ),
      );
    } else {
      enemies.forEach((enemy) => enemy.render(c));
      // Puntuacion
      scoreText.render(c);
      // La barra al final
      barra.render(c);
    }
  }

  @override
  void update(double t) {
    if (state == StateGame.playing) {
      enemies.forEach((enemy) => enemy.update(t));
      enemies.removeWhere((e) => e.isDead);
      enemySpawner.update(t);
      player.update(t);
      barra.update(t);
      scoreText.update(t);
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 10;
  }

  @override
  void onTapDown(TapDownDetails td) {
    if (state == StateGame.playing) {
      enemies.forEach((e) {
        if (e.enemyRect.contains(td.globalPosition)) {
          e.onTapDown();
        }
      });
    }
  }

  @override
  void onTapUp(TapUpDetails details) {}

  void spawnEnemy() {
    double x, y;
    String img = 'cometa.png';
    switch (rand.nextInt(4)) {
      case 0:
        // Solo arriba
        x = rand.nextDouble() * screenSize.width;
        y = -tileSize * 2.5;
        img = 'cometa-arriba.png';
        break;
      case 1:
        // Solo en la derecha
        x = screenSize.width + tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        img = 'cometa-derecha.png';
        break;
      case 2:
        // Solo abajo
        x = rand.nextDouble() * screenSize.width;
        y = screenSize.height + tileSize * 2.5;
        img = 'cometa-abajo.png';
        break;
      case 3:
        // Solo izquierda
        x = -tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        img = 'cometa-izquierda.png';
        break;
    }

    enemies.add(Enemy(this, x, y, img));
  }

  @override
  void onDetach() {
    super.onDetach();
  }
}

enum StateGame { menu, playing }
