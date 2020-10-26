
import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/player.dart';
import 'components/enemy.dart';
import 'components/healt_bar.dart';
import 'components/score_text.dart';
import 'components/max_score.dart';
import 'components/start_button.dart';
import 'enemy_spawner.dart';
import 'state.dart';

class GameController extends Game with TapDetector {
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
  MaxScoreText maxScore;
  // Estados  
  State state; 
  // Home 
  StartButton startButton; 


  GameController(this.store) {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    player = Player(this);
    score = 0;
    state = State.menu;
    enemies = List();
    barra = HealtBar(this);
    enemySpawner = EnemySpawner(this);
    scoreText = ScoreText(this);
    maxScore = MaxScoreText(this);
    startButton = StartButton(this);
  }

  @override
  void render(Canvas c) {
    Rect backgroud = Rect.fromLTWH(
      0, 0, 
      screenSize.width, 
      screenSize.height
    );

    Paint backPaint = Paint()..color = Color(0xFFFAFAFA);
    c.drawRect(backgroud, backPaint);
    player.render(c);

    if (state == State.menu) {
      startButton.render(c);
      maxScore.render(c);
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
    if (state == State.menu) { 
      startButton.update(t);
      maxScore.update(t);
    } else if (state == State.playing) {
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
    if (state == State.menu) {
      state = State.playing;
    } else if (state == State.playing) {
      enemies.forEach((e) {
        if (e.enemyRect.contains(td.globalPosition)) {
          e.onTapDown();
        }
      });
    }
  }

  @override
  void onTapUp(TapUpDetails details) {
    print("Player tap up on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
  }

  void spawnEnemy() {
    double x, y; 
    switch(rand.nextInt(4)) {
      case 0: 
        // Solo arriba
        x = rand.nextDouble() * screenSize.width;
        y = -tileSize * 2.5;
      break;
      case 1:
        // Solo en la derecha
        x = screenSize.width + tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
      break;
      case 2:
        // Solo abajo
        x = rand.nextDouble() * screenSize.width;
        y = screenSize.height + tileSize * 2.5; 
      break;
      case 3: 
        // Solo izquierda 
        x = -tileSize * 2.5; 
        y = rand.nextDouble() * screenSize.height;
      break;
    }

    enemies.add(Enemy(this, x, y));
  }

  @override
  void onDetach() {
    super.onDetach();
    print('SALIMOS');
  }



}