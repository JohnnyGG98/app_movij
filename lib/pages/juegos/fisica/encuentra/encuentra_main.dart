import 'dart:math';
import 'dart:ui';

import 'package:app_movij/C/colors.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/boton_pausa.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/menu_encuentra.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/personaje_encuentra.dart';
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

  EncuentraMain(this.context, this.personajeSelec){
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    speed = 150;
    Flame.images.loadAll(IMG_PERSONAJES);
    menuJuego = MenuEncuentra(this);
    botonPausa = BotonPausa(this.screenSize);
    txtInfo = TxtInformacionEncontrar(this);
    iniciarJuego();
  }

  void iniciarJuego() {
    personajes = new List();
    estado = _EstadoJuego.jugando;
    speed = 150;
    puntuacion = 0;
    numEncontrar = rand.nextInt(25) + 10;  
    _spawnOtrosPersonajes();
    _spawnPersonaje();
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
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
  }

  void onTapDowm(TapDownDetails td) {
    personajes.forEach((p) {
      if (p.personaje.contains(td.globalPosition)) {
        p.onTapDowm();
        puntuacion++;
        // Actualizamos el numero de personajes 
        if (puntuacion % 5 == 0 && puntuacion != 0) {
          _spawnOtrosPersonajes();
          _spawnPersonaje();
          if (speed < maxSpeed) {
            speed += 25;
          }
        }
      }
    });

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
    String personaje = '';
    for (var i = 0; i < numPersonajesBuscar; i++) {
      personaje = IMG_PERSONAJES[rand.nextInt(IMG_PERSONAJES.length)];
      if (personajes.length < maxPersonajes && personaje != personajeSelec) {
        personajes.add(new PersonajeEncuentra(
          this, false, personaje
        ));  
      }
    }
  }

}