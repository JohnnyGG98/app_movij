import 'package:app_movij/config/config_export.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class ButtonPlay extends StatefulWidget {
  final Function onTap;

  const ButtonPlay({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  _ButtonPlayState createState() => _ButtonPlayState();
}

class _ButtonPlayState extends State<ButtonPlay> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: controller);

    animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(3, 0),
    ).animate(curve);
    // Agregando listener al animation de play
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onTap();
        Future.delayed(const Duration(milliseconds: 300), () {
          controller.reset();
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
        onTap: () {
          Flame.audio.play('play.wav', volume: 0.25);
          controller.forward();
        },
        child: SlideTransition(
          position: animation,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: AppThemeColors.BLUE,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'JUGAR',
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                // letterSpacing: 4.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
