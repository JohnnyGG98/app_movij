import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/pages/menu/seleccionar_perfil.dart';
import 'package:app_movij/utils/transitions.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class HomePlayButton extends StatefulWidget {
  @override
  _HomePlayButtonState createState() => _HomePlayButtonState();
}

class _HomePlayButtonState extends State<HomePlayButton>
    with TickerProviderStateMixin {
  AnimationController scaleController;
  AnimationController bouncedController;

  Animation<double> scaleAnimation;
  Animation<double> bouncedAnimation;

  double scale;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
            context,
            DefaultFadeTransition(child: SeleccionarPerfilPage()),
          );

          Future.delayed(Duration(milliseconds: 300), () {
            scaleController.reset();
          });
        }
      });

    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0,
    ).animate(scaleController);

    // Animacion para salte el boton
    bouncedController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    bouncedAnimation = Tween<double>(
      begin: 40.0,
      end: 50.0,
    ).animate(bouncedController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          bouncedController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          bouncedController.forward();
        }
      });

    // Iniciamos la animacion para que salte el boton
    bouncedController.forward();
  }

  @override
  void dispose() {
    scaleController?.dispose();
    bouncedController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        scaleController.forward();
        await Flame.audio.play('play.wav', volume: 0.25);
      },
      child: AnimatedBuilder(
        animation: scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: scaleAnimation.value,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppThemeColors.GREEN,
              borderRadius: BorderRadius.circular(15),
            ),
            child: AnimatedBuilder(
              animation: bouncedAnimation,
              builder: (context, child) => Container(
                padding: EdgeInsets.symmetric(
                  vertical: bouncedAnimation.value / 2,
                  horizontal: bouncedAnimation.value,
                ),
                decoration: BoxDecoration(
                  color: AppThemeColors.GREEN.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'jugar'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
