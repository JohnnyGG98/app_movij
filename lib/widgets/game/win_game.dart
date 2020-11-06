import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/widgets/game/button_option_game.dart';
import 'package:app_movij/widgets/game/dance_win_game.dart';
import 'package:flutter/material.dart';

class WinGame extends StatelessWidget {
  final Function tapNewGame;
  final Function tapClose;

  const WinGame({
    Key key,
    @required this.tapNewGame,
    @required this.tapClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              // color: Colors.red,
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
          )
        ],
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        DanceWinGame(),
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
