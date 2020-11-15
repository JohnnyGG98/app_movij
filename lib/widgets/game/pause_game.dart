import 'package:app_movij/config/app_theme_colors.dart';
import 'package:app_movij/widgets/game/button_option_game.dart';
import 'package:app_movij/widgets/game/text_animation_game.dart';
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
        TextAnimationGame(
          text: 'Menu'.toUpperCase(),
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
          maxFontSize: 40,
          minFontSize: 35,
        ),
        SizedBox(height: 30),
        ButtonOptionGame(
          onTap: tapContinue,
          label: 'Continuar',
          color: AppThemeColors.BLUE,
        ),
        ButtonOptionGame(
          onTap: tapNewGame,
          label: 'Nuevo',
          color: AppThemeColors.GREEN,
        ),
        ButtonOptionGame(
          onTap: tapClose,
          label: 'Salir',
          color: AppThemeColors.RED,
        ),
      ],
    );
  }
}