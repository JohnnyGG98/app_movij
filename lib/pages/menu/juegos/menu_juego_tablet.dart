import 'package:app_movij/pages/menu/juegos/juegos_tf.dart';
import 'package:app_movij/pages/menu/juegos/juegos_tl.dart';
import 'package:app_movij/templates/menu_lateral.dart';
import 'package:flutter/material.dart';

class MenuJuegoTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juegos'),
      ),
      drawer: MenuLateral(),
      body: Row(
        children: <Widget>[
          Expanded(child: JuegosTFPage()),
          Expanded(child: JuegosTLPage()),
        ],
      ),
    );
  }
}
