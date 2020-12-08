import 'dart:async';
import 'dart:math';

import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/pages/juegos/fisica/direccion/const_direccion.dart';
import 'package:app_movij/pages/juegos/fisica/encuentra/export_encuentra.dart';
import 'package:app_movij/utils/global.dart';
import 'package:app_movij/widgets/game/close_button_game.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class DireccionMain extends StatefulWidget {
  @override
  _DireccionMainState createState() => _DireccionMainState();
}

class _DireccionMainState extends State<DireccionMain>
    with SingleTickerProviderStateMixin {
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  // Para la animacion del moviimiento
  AnimationController controller;
  CurvedAnimation curve;
  Direccion model;
  int seed = rand.nextInt(4);
  String direction = '';
  bool change = false;
  // Iniciamos en menos uno porque siempre al inicio sumamos uno
  int movent = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '# $movent',
            style: TextStyle(
              color: AppThemeColors.BLUE_DARK,
              fontSize: 50,
              letterSpacing: 2.5,
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: SlideTransition(
              position: model.animation.animate(curve),
              child: Center(
                child: Icon(
                  model.icon,
                  size: 300,
                  color: AppThemeColors.BLUE_DARK,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            model.label.toUpperCase(),
            style: TextStyle(
              color: AppThemeColors.BLUE_DARK,
              fontSize: 50,
              letterSpacing: 2.5,
            ),
          ),
        ],
      ),
      floatingActionButton: CloseButtonGame(),
    );
  }

  Direccion getRandom() {
    movent++;
    change = true;
    seed++;
    List<String> keys = direcciones.keys.toList();
    keys..shuffle(Random(seed));
    direction = keys[0];

    Direccion dir = direcciones[direction];
    // Nos aseguramos de que nunca se repita la misma direccion
    if (model == dir) return getRandom();

    // Delayed para indicar que ya no esta en el proceso de cambio
    Future.delayed(const Duration(milliseconds: 750), () {
      change = false;
    });
    Global().ftts.speak(direction);
    return direcciones[direction];
  }

  @override
  void dispose() {
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    model = getRandom();
    // Iniciamos las animaciones
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    curve = CurvedAnimation(curve: Curves.easeInOut, parent: controller);

    controller.repeat();

    _streamSubscriptions.add(
      userAccelerometerEvents.listen(
        (UserAccelerometerEvent event) {
          // Si aprobo tomamos otro punto
          if (change) return;

          if (event.z > MOVEMENT && direction == 'arriba') {
            setState(() {
              model = getRandom();
            });
          }

          if (event.z < -MOVEMENT && direction == 'abajo') {
            setState(() {
              model = getRandom();
            });
          }

          if (event.x > MOVEMENT && direction == 'derecha') {
            setState(() {
              model = getRandom();
            });
          }

          if (event.x < -MOVEMENT && direction == 'izquierda') {
            setState(() {
              model = getRandom();
            });
          }

          if (event.y > MOVEMENT && direction == 'arriba') {
            setState(() {
              model = getRandom();
            });
          }

          if (event.y < -MOVEMENT && direction == 'abajo') {
            setState(() {
              model = getRandom();
            });
          }
        },
      ),
    );
    super.initState();
  }
}
