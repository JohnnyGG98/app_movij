import 'package:app_movij/models/button_game_model.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class ButtonGame extends StatelessWidget {
  final ButtonGameModel model;
  const ButtonGame({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Flame.audio.play('play.wav', volume: 0.15);
        if (model.haveRoute) {
          Navigator.of(context).pushNamed(model.page);
        } else {
          model.onTap(context);
        }
      },
      child: _getButton(),
    );
  }

  Widget _getButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xFFECEBEB),
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
            color: model.color,
            width: 5,
          ),
        ),
      ),
      child: Text(
        model.juego,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(0xFF323639),
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
        ..._getIcon(Icons.calendar_today, ' 10-20-2019 10:20:12'),
        Spacer(),
        ..._getIcon(Icons.developer_board, ' 4 Ganados'),
      ],
    );
  }

  List<Widget> _getIcon(IconData icon, String label) {
    return [
      Icon(
        icon,
        size: 13,
        color: Color(0xFF3C3E40),
      ),
      Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: Color(0xFF3C3E40),
        ),
      )
    ];
  }
}
