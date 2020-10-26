import 'package:app_movij/models/button_game_model.dart';
import 'package:app_movij/pages/menu/juegos/head_list_game.dart';
import 'package:app_movij/widgets/game_menu/button_game.dart';
import 'package:flutter/material.dart';

class JuegosTFPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
