import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/models/button_game_model.dart';
import 'package:app_movij/pages/menu/juegos/head_list_game.dart';
import 'package:app_movij/widgets/game_menu/button_game.dart';
import 'package:flutter/material.dart';

class JuegosTFPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppThemeCons.PADDING_LIST_GAMES,
      child: Column(
        children: [
          HeadListGame(
            tipoJuego: 'Terapia\nFisica',
            icon: Icons.touch_app_sharp,
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: AppThemeCons.PADDING_BUTTON_GAMES,
              itemCount: buttonsTF.length,
              itemBuilder: (BuildContext context, int i) {
                return ButtonGame(model: buttonsTF[i]);
              },
            ),
          )
        ],
      ),
    );
  }
}
