import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/models/button_game_model.dart';
import 'package:app_movij/utils/transitions.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class ButtonGame extends StatefulWidget {
  final ButtonGameModel model;
  const ButtonGame({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  _ButtonGameState createState() => _ButtonGameState();
}

class _ButtonGameState extends State<ButtonGame> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: controller);

    animation = Tween<Offset>(
      begin: widget.model.animationStart,
      end: Offset.zero,
    ).animate(curve);

    controller.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.reverse();
        Flame.audio.play('play.wav', volume: 0.15);
        Future.delayed(const Duration(milliseconds: 350), () {
          if (widget.model.child != null) {
            Navigator.push(
              context,
              DefaultFadeTransition(child: widget.model.child),
            );
          } else {
            widget.model?.onTap(context);
          }
        });
        // Volvemos a la posicion inicial en bg
        Future.delayed(const Duration(milliseconds: 500), () {
          controller.forward();
        });
      },
      child: FadeTransition(
        opacity: controller,
        child: SlideTransition(
          position: animation,
          child: _getButton(),
        ),
      ),
    );
  }

  Widget _getButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppThemeColors.WHITE,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38.withOpacity(0.3),
            spreadRadius: 1.5,
            blurRadius: 5,
            offset: Offset(2, 4),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getJuego(),
          SizedBox(height: 5),
          Divider(thickness: 1.5),
          _getBottom(),
        ],
      ),
    );
  }

  Widget _getJuego() {
    return Container(
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: widget.model.color,
            width: 5,
          ),
        ),
      ),
      child: Text(
        widget.model.juego,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: AppThemeColors.BLACK,
          fontWeight: FontWeight.w700,
          fontSize: 22,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Row _getBottom() {
    return Row(
      children: [
        ..._getIcon(
            Icons.calendar_today, ' ${widget.model.register?.labelLastPlay}'),
        Spacer(),
        ..._getIcon(
            Icons.developer_board, ' ${widget.model.register?.labelWins}'),
      ],
    );
  }

  List<Widget> _getIcon(IconData icon, String label) {
    return [
      Icon(
        icon,
        size: 13,
        color: AppThemeColors.BLACK_ICON,
      ),
      Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: AppThemeColors.BLACK_ICON,
        ),
      )
    ];
  }
}
