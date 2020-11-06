import 'dart:math';
import 'dart:ui';

import 'package:app_movij/pages/juegos/fisica/encuentra/export_encuentra.dart';

// Constantes del juego
enum _EstadoJuego { jugando, menu, ganaste }

class EncuentraMain extends Game with HasWidgetsOverlay, TapDetector {
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

  EncuentraMain(this.context, this.personajeSelec) {
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
      iconName: 'emoticon/emoticon-sad.png',
    );
    smileSprite = FeedbackGame(
      em: this,
      iconName: 'emoticon/emoticon-smile.png',
    );
    spawnPersonajes = SpawnerEncuentra(this, maxPersonajes);
    iniciarJuego();
  }

  void iniciarJuego() {
    personajes = new List();
    estado = _EstadoJuego.jugando;
    speed = 150;
    puntuacion = 0;
    // numEncontrar = rand.nextInt(25) + 10;
    numEncontrar = 1;
    spawn();
  }

  @override
  void render(Canvas canvas) {
    Rect backgroud = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backPaint = Paint()..color = AppThemeColors.BLUE;
    canvas.drawRect(backgroud, backPaint);

    if (estado == _EstadoJuego.jugando) {
      botonPausa.render(canvas);

      personajes.forEach((p) {
        p.render(canvas);
      });
      txtInfo.render(canvas);
      sadSprite.render(canvas);
      smileSprite.render(canvas);
    }

    if (estado == _EstadoJuego.ganaste) {
      addWidgetOverlay(
        'win',
        WinGame(
          tapClose: () {
            super.onDetach();
            Navigator.pop(context);
          },
          tapNewGame: () {
            removeWidgetOverlay('win');
            iniciarJuego();
          },
        ),
      );
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

  @override
  void onTapUp(TapUpDetails details) {}

  @override
  void onTapDown(TapDownDetails td) {
    if (estado == _EstadoJuego.jugando) {
      personajes.forEach((p) async {
        if (p.personaje.contains(td.globalPosition)) {
          bool encontrado = p.onTapDowm();
          if (encontrado) {
            await Flame.audio.play('correct.wav');
          } else {
            await Flame.audio.play('incorrect.ogg');
          }
          if (puntuacion == numEncontrar) {
            Future.delayed(const Duration(milliseconds: 300), () {
              estado = _EstadoJuego.ganaste;
            });
          }
        }
      });
    }

    if (botonPausa.hitBox.contains(td.globalPosition)) {
      if (estado == _EstadoJuego.menu) {
        estado = _EstadoJuego.jugando;
        removeWidgetOverlay('menu');
      } else {
        estado = _EstadoJuego.menu;
        addWidgetOverlay(
          'menu',
          getMenu(),
        );
      }
    }
  }

  void spawn() {
    _spawnPersonaje();
    _spawnOtrosPersonajes();
  }

  void _spawnPersonaje() {
    int numPersonajesBuscar = rand.nextInt(2) + 1;
    for (var i = 0; i < numPersonajesBuscar; i++) {
      if (personajes.length < maxPersonajes) {
        personajes.add(new PersonajeEncuentra(this, true, personajeSelec));
      }
    }
  }

  void _spawnOtrosPersonajes() {
    int numPersonajesBuscar = rand.nextInt(3) + 1;
    int numSpawneados = 0;
    String personaje = '';
    while (numSpawneados < numPersonajesBuscar) {
      personaje = IMG_PERSONAJES[rand.nextInt(IMG_PERSONAJES.length)];
      if (personajes.length < maxPersonajes && personaje != personajeSelec) {
        personajes.add(new PersonajeEncuentra(this, false, personaje));
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

  Widget getMenu() {
    return PauseGame(
      tapContinue: () {
        estado = _EstadoJuego.jugando;
        removeWidgetOverlay('menu');
      },
      tapClose: () {
        super.onDetach();
        Navigator.pop(context);
      },
      tapNewGame: () {
        removeWidgetOverlay('menu');
        iniciarJuego();
      },
    );
  }
}
