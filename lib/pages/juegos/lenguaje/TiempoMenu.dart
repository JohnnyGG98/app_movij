import 'dart:math';

import 'package:app_movij/widgets/game/personaje_preview.dart';
import 'package:app_movij/widgets/menu/menu_lateral.dart';
import 'package:flutter/material.dart';

class MenuTiempoPage extends StatefulWidget {
  @override
  _MenuTiempoPageState createState() => _MenuTiempoPageState();
}

class _MenuTiempoPageState extends State<MenuTiempoPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animationRotate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5000),
    );

    _animationRotate = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        // setState(() {
        //   _controller.repeat();
        // });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Altura de la tierra 484
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tiempo'),
      ),
      drawer: MenuLateral(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/games/tl/animation/space-new.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            top: (h * 0.5) - (w * 0.45),
            child: PersonaPreview(
              'assets/games/tl/animation/tierra.png',
              height: w * 0.60,
              width: w * 0.60,
              tiempo: 1000,
            ),
          ),
          Positioned(
            left: -h * 0.05,
            top: -h * 0.05,
            child: PersonaPreview(
              'assets/games/tl/animation/sol.png',
              height: w * 0.30,
              width: w * 0.30,
            ),
          ),
          Positioned(
            left: -(h / 2),
            top: -(h / 2),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              height: h,
              width: h,
            ),
          ),
          Center(
            child: RotationTransition(
              turns: _animationRotate,
              child: Transform.translate(
                offset: Offset((w * 0.50) * (cos(pi)), (w * 0.50) * (sin(pi))),
                child: PersonaPreview(
                  'assets/games/tl/animation/luna.png',
                  height: w * 0.15,
                  width: w * 0.15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
