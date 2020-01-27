import 'package:app_movij/templates/btn_juego.dart';
import 'package:app_movij/templates/menu_lateral.dart';
import 'package:flutter/material.dart';

class MenuEncuentraPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encuentra'),
      ),
      drawer: getDrawer(context),
      body: _menu(),
    );
  }

  Widget _menu() {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
      children: <Widget>[

        getBtnPersonaje('assets/games/tf/Nave.png', (){}),
        SizedBox(height: 40,),
        getBtnPersonaje('assets/games/tf/Barco.png', (){}),
        SizedBox(height: 40,),
        getBtnPersonaje('assets/games/tf/SoccerBall.png', (){}),
        SizedBox(height: 40,),

      ],
    );
  }

}