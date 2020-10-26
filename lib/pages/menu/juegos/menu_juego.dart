import 'package:app_movij/pages/menu/juegos/menu_juego_tablet.dart';
import 'package:app_movij/templates/menu_lateral.dart';
import 'package:app_movij/templates/widgets/responsive.dart';
import 'package:app_movij/utils/global.dart';
import 'package:app_movij/widgets/bottom_menu/animated_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'juegos_tf.dart';
import 'juegos_tl.dart';

class MenuJuegoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Global().actualRoute = 'menuJuego';

    return Responsive(
      mobile: MenuJuegoMobile(),
      tablet: MenuJuegoTablet(),
    );
  }
}

class MenuJuegoMobile extends StatefulWidget {
  @override
  _MenuJuegoMobilState createState() => _MenuJuegoMobilState();
}

class _MenuJuegoMobilState extends State<MenuJuegoMobile> {
  int _actualPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Juegos')),
      drawer: MenuLateral(),
      body: _loadPage(_actualPage),
      bottomNavigationBar: AnimatedBottomBar(
        onChange: (page) {
          setState(() {
            _actualPage = page;
          });
        },
      ),
    );
  }

  Widget _loadPage(int actualPage) {
    switch (actualPage) {
      case 0:
        return JuegosTFPage();
      case 1:
        return JuegosTLPage();

      default:
        return Container(color: Colors.white);
    }
  }
}
