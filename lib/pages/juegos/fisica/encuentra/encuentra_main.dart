import 'dart:math';
import 'dart:ui';

import 'package:app_movij/C/colors.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/boton_pausa.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/feedback_game.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/menu_encuentra.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/personaje_encuentra.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/spawner_encuentra.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/txtinfo_encontrar.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

// Constantes del juego  
enum _EstadoJuego {
  jugando,
  perdio,
  gano,
  menu
}

class EncuentraMain extends Game  {

  // Constantes
  final double maxSpeed = 250;
  final int maxPersonajes = 15;
  // Lista de los personajes del juego  
  static const List<String> IMG_PERSONAJES = [
    'Barco.png',
    'balon.png',
    'Nave.png'
  ];
  // Lista de los iconos del feedback 
  static const List<String> IMG_FEEDBACK = [
    'emoticon/emoticon-sad.png',
    'emoticon/emoticon-smile.png'
  ];
  // Para iniciar el numero de objetos a buscar primero  
  final Random rand = Random();
  // Para saber el objeto seleccionado para buscarlo 
  final String personajeSelec;
  // Contexto para poder salir del juego 
  final BuildContext context;

  // Tamaño de la pantalla  
  Size screenSize;
  double speed;
  int puntuacion;
  int numEncontrar;
  _EstadoJuego estado;
  List<PersonajeEncuentra> personajes;
  // Pantallas del juego
  TxtInformacionEncontrar txtInfo;  
  MenuEncuentra menuJuego;
  BotonPausa botonPausa;
  // Sprites para el feedback 
  FeedbackGame sadSprite;
  FeedbackGame smileSprite;
  // Spawner 
  SpawnerEncuentra spawnPersonajes;

  EncuentraMain(this.context, this.personajeSelec){
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    speed = 150;
    Flame.images.loadAll(IMG_PERSONAJES + IMG_FEEDBACK);
    menuJuego = MenuEncuentra(this);
    botonPausa = BotonPausa(this.screenSize);
    txtInfo = TxtInformacionEncontrar(this);
    sadSprite = FeedbackGame(
      em: this, 
      iconName: 'emoticon/emoticon-sad.png'
    );
    smileSprite = FeedbackGame(
      em: this, 
      iconName: 'emoticon/emoticon-smile.png'
    );
    spawnPersonajes = SpawnerEncuentra(this, maxPersonajes);
    iniciarJuego();
  }

  void iniciarJuego() {
    personajes = new List();
    estado = _EstadoJuego.jugando;
    speed = 150;
    puntuacion = 0;
    numEncontrar = rand.nextInt(25) + 10;  
    spawn();
  }

  @override
  void render(Canvas canvas) {
    Rect backgroud = Rect.fromLTWH(
      0, 0, 
      screenSize.width, 
      screenSize.height
    );

    Paint backPaint = Paint()..color = PRIMARY_COLOR;
    canvas.drawRect(backgroud, backPaint);

    botonPausa.render(canvas);
    
    if (estado == _EstadoJuego.jugando) {
      personajes.forEach((p) {
        p.render(canvas);
      });
      txtInfo.render(canvas);

      sadSprite.render(canvas);
      smileSprite.render(canvas);
    }

    if (estado == _EstadoJuego.menu) {
      menuJuego.render(canvas);
    }
    
  }

  @override
  void update(double t) {
    if (estado == _EstadoJuego.jugando) {
      personajes.forEach((p) {
        p.update(t);
      });
      txtInfo.update(t);
      if (sadSprite.mostrar) {
        sadSprite.update(t);
      }

      if (smileSprite.mostrar) {
        smileSprite.update(t);
      }
      spawnPersonajes.update(t);
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
  }

  void onTapDowm(TapDownDetails td) {
    if (estado == _EstadoJuego.jugando) {
      personajes.forEach((p) {
        if (p.personaje.contains(td.globalPosition)) {
          p.onTapDowm();

          if (puntuacion == numEncontrar) {
            estado = _EstadoJuego.menu;
          }

        }
      });
    }

    if (botonPausa.hitBox.contains(td.globalPosition)) {
      if (estado == _EstadoJuego.menu) {
        estado = _EstadoJuego.jugando;
        botonPausa.jugar();
      } else {
        estado = _EstadoJuego.menu;  
        botonPausa.pausar();
      }
    }

    if (estado != _EstadoJuego.menu) return;

    if (menuJuego.hitBoxContinuar.contains(td.globalPosition)) {
      estado = _EstadoJuego.jugando;
      botonPausa.jugar();
    }

    if (menuJuego.hitBoxSalir.contains(td.globalPosition)) {
      super.onDetach();
      Navigator.pop(context);
    }

    if (menuJuego.hitBoxNuevo.contains(td.globalPosition)) {
      iniciarJuego();
    }

  }

  // Para el spawn 

  void spawn() {
    _spawnPersonaje();
    _spawnOtrosPersonajes();
  }

  void _spawnPersonaje() {
    int numPersonajesBuscar = rand.nextInt(2) + 1;
    for (var i = 0; i < numPersonajesBuscar; i++) {
      if (personajes.length < maxPersonajes) {
        personajes.add(new PersonajeEncuentra(
          this, true, personajeSelec
        ));
      }  
    }
  }

  void _spawnOtrosPersonajes() {
    int numPersonajesBuscar = rand.nextInt(3) + 1;
    int numSpawneados = 0;
    String personaje = '';
    while(numSpawneados < numPersonajesBuscar) {
      personaje = IMG_PERSONAJES[rand.nextInt(IMG_PERSONAJES.length)];
      if (personajes.length < maxPersonajes && personaje != personajeSelec) {
        personajes.add(new PersonajeEncuentra(
          this, false, personaje
        ));  
        numSpawneados++;
      }
      // Esto es para que no ocurra el bug de que no spawneo todo y se quede ejecutando para siempre este while y nos mate el game 
      if (personajes.length >= maxPersonajes) {
        numSpawneados = personajes.length;
      }
    }
  }

  @override
  void onDetach() {
    super.onDetach();
    Flame.images.clearCache();
  }

}