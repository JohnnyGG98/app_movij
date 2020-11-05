import 'package:app_movij/config/app_theme_colors.dart';
import 'package:flutter/material.dart';

class PauseGame extends StatelessWidget {
  final Function tapContinue;
  final Function tapClose;
  final Function tapNewGame;

  const PauseGame({
    Key key,
    @required this.tapContinue,
    @required this.tapClose,
    @required this.tapNewGame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 2,
                  offset: Offset(7, 7),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.75,
            child: body(),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        _MenuAnimation(),
        SizedBox(height: 30),
        _Button(
          onTap: tapContinue,
          label: 'Continuar',
          color: AppThemeColors.BLUE,
        ),
        _Button(
          onTap: tapNewGame,
          label: 'Nuevo',
          color: AppThemeColors.GREEN,
        ),
        _Button(
          onTap: tapClose,
          label: 'Salir',
          color: AppThemeColors.RED,
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final Function onTap;
  final Color color;
  final String label;

  const _Button({
    Key key,
    @required this.onTap,
    @required this.color,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 22.5),
        padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 30),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 3.5),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              spreadRadius: 2,
              offset: Offset(6, 7),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}

class _MenuAnimation extends StatefulWidget {
  @override
  __MenuAnimationState createState() => __MenuAnimationState();
}

class __MenuAnimationState extends State<_MenuAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    animation = Tween<double>(begin: 35, end: 40).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          height: 40,
          child: Text(
            'Menu'.toUpperCase(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: animation.value,
              // letterSpacing: 1.1,
            ),
          ),
        );
      },
    );
  }
}
