import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/widgets/game/button_option_game.dart';
import 'package:app_movij/widgets/game/dance_win_game.dart';
import 'package:flutter/material.dart';

class WinGamePage extends StatelessWidget {
  final Function tapNewGame;

  const WinGamePage({
    Key key,
    @required this.tapNewGame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double widthSeparated = 30;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DanceWinGame(),
          SizedBox(height: widthSeparated),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: widthSeparated,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ButtonOptionGame(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    label: 'Salir',
                    color: AppThemeColors.RED,
                  ),
                ),
                SizedBox(
                  width: widthSeparated,
                ),
                Expanded(
                  child: ButtonOptionGame(
                    onTap: tapNewGame,
                    label: 'Nuevo',
                    color: AppThemeColors.GREEN,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
